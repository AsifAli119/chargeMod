part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginGenerateOtpEvent extends LoginEvent {
  final String phoneNumber;

  LoginGenerateOtpEvent(this.phoneNumber);
}