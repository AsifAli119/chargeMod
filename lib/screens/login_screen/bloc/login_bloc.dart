import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chargemod_asif/screens/login_screen/login_api.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()){
    on<LoginGenerateOtpEvent>(loginGenerateOtpEvent);
  }

  FutureOr<void> loginGenerateOtpEvent(LoginGenerateOtpEvent event, Emitter<LoginState> emit) async{
    if (event is LoginGenerateOtpEvent) {
      try{
        await login(event.phoneNumber);
        emit(LoginOtpSentState());
      }catch (error) {
        print("Error during login: $error");
        emit (LoginErrorState("Failed to generate OTP"));
      }// You can provide an error message here
    }
  }
  }





  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   if (event is LoginGenerateOtpEvent) {
  //     try {
  //
  //       await login(event.phoneNumber);
  //
  //       yield LoginOtpSentState();
  //     } catch (error) {
  //       print("Error during login: $error");
  //       yield LoginErrorState("Failed to generate OTP");
  //     }
  //   }
  // }


