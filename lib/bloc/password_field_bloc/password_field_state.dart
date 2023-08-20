part of 'password_field_bloc.dart';

@immutable
abstract class PasswordFieldState {}

class PasswordFieldInitialState extends PasswordFieldState {}

class PasswordVisibleState extends PasswordFieldState {
  bool isObscureText;

  PasswordVisibleState({required this.isObscureText});
}
