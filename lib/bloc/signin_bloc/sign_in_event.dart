part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInInitialEvent extends SignInEvent {}

class SignInSuccessfullyEvent extends SignInEvent {
  String email;
  String password;
  SignInSuccessfullyEvent({required this.email, required this.password});
}
