part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginOtpSentState extends LoginState {}
class LoginErrorState extends LoginState {
  final String;
  LoginErrorState(this.String);
}
