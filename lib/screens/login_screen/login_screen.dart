import 'dart:convert';

import 'package:chargemod_asif/screens/login_screen/bloc/login_bloc.dart';
import 'package:chargemod_asif/screens/login_screen/components/Registration.dart';
import 'package:chargemod_asif/screens/login_screen/components/text_widget.dart';
import 'package:chargemod_asif/utilis/theme/theme.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../utilis/theme/custom_themes/text_theme.dart';
import '../../utilis/theme/custom_themes/text_theme.dart';
import '../otp_screen/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );


  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery
        .of(context)
        .platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    !isDarkMode ? KAppTheme.lightTheme : KAppTheme.lightTheme;
    return Scaffold(
        body: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
      if (state is LoginInitial) {
        return RegisterScreen(isDarkMode: isDarkMode, phoneController: phoneController, selectedCountry: selectedCountry, formKey: formKey,);
      }
      else if(state is LoginOtpSentState){
        return OtpScreen(phoneNumber: phoneController.text,);
      }else if(state is LoginErrorState){
        return const Scaffold(
          body: Center(
            child: Text("Error loading page\n Please restart the App"),
          ),
        );
      }
      return SizedBox();

            },
          ),
        ));
  }

}



