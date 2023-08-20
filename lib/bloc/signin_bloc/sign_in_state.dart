part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInLoadingState extends SignInState{}
class SignInLoadedState extends SignInState{}
class SignInFailedState extends SignInState{
  final String message;
  SignInFailedState({required this.message});
}
