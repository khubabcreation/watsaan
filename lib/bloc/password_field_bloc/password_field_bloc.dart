import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_field_event.dart';
part 'password_field_state.dart';

class PasswordFieldBloc extends Bloc<PasswordFieldEvent, PasswordFieldState> {
  PasswordFieldBloc() : super(PasswordFieldInitialState()) {
    on<VisiblePasswordEvent>((event, emit) {
      emit.call(PasswordVisibleState(isObscureText: event.obscureText));
    });
  }
}
