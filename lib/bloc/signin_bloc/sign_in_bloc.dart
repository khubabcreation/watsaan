import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../utils/app_firebase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInInitialEvent>((event, emit) {
      emit.call(SignInInitial());
    });
    on<SignInSuccessfullyEvent>((event, emit) async {
      emit.call(SignInLoadingState());
      try {

        FirebaseFirestore firestore = FirebaseFirestore.instance;
        QuerySnapshot<Map<String, dynamic>> doc =
            await firestore.collection('super_admin').get();
        String firebaseEmail = doc.docs[0].get('email');
        String userInputEmail = event.email;
        if (firebaseEmail == userInputEmail) {
          UserCredential userCredential =
              await signInUser(event.email, event.password);
          User? user = userCredential.user;
          if (user != null) {
            emit.call(SignInLoadedState());
          } else {
            emit.call(SignInFailedState(message: 'This Email not Exists'));
          }
        } else {

          emit.call(SignInFailedState(message: 'You are not Super Admin'));
        }
      } on FirebaseAuthException catch (e) {
        emit.call(SignInFailedState(message: e.toString()));
      } on FirebaseException catch (e) {
        emit.call(SignInFailedState(message: e.toString()));
      } catch (e) {
        emit.call(SignInFailedState(message: e.toString()));
      }
    });
  }
}
