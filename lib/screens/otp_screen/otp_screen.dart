import 'dart:convert';

import 'package:chargemod_asif/screens/login_screen/login_screen.dart';
import 'package:chargemod_asif/utilis/theme/custom_themes/text_theme.dart';
import 'package:chargemod_asif/utilis/theme/theme.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../login_screen/update_profile/updateProfile.dart';
import 'otp_screen_components/opt_verify.dart';
import 'otp_screen_components/otp_resend_function.dart';
import 'otp_screen_components/text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();
  TextEditingController field4 = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Brightness brightness = MediaQuery
        .of(context)
        .platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    !isDarkMode ? KAppTheme.lightTheme : KAppTheme.lightTheme;

    String enteredOtp = "${field1.text}${field2.text}${field3.text}${field4.text}";

// Parse the concatenated string to an integer with error handling
    void getEnteredOtp() {
      String enteredOtp = "${field1.text}${field2.text}${field3.text}${field4.text}";

      if (enteredOtp.length == 4) {
        int otpValue = int.parse(enteredOtp);
        print("Entered OTP: $otpValue");
      } else {
        print("Please enter a 4-digit OTP.");
      }
    }
  
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 55,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        }, icon: const Icon(Icons.arrow_left, size: 35,)),
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*.4),
                          child:  Text("Verification", style: !isDarkMode ? KAppTheme.lightTheme.textTheme.titleMedium : KAppTheme.darkTheme.textTheme.titleMedium,),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Center(child: Text("We've send you the verification\n code on ${widget.phoneNumber}", style: !isDarkMode ? KAppTheme.lightTheme.textTheme.titleMedium : KAppTheme.darkTheme.textTheme.titleMedium, textAlign: TextAlign.center,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOtpTextField(field1),
                      buildOtpTextField(field2),
                      buildOtpTextField(field3),
                      buildOtpTextField(field4),
                    ],
                  ),
                ),
                // Text("Resend OTP", style: KTextTheme.orangeTextTheme.titleMedium,),
                OtpTimerButton(
                  radius: 0.0,
                    buttonType: ButtonType.text_button,
                    backgroundColor: Colors.transparent,
                    onPressed: (){
                      resendOtp(widget.phoneNumber);
                    },
                    text: Text( "Resend OTP", style: KTextTheme.orangeTextTheme.titleMedium,), duration: 30),
                SizedBox(height: MediaQuery.of(context).size.height*.4),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: InkWell(
                    onTap: () {
                            getEnteredOtp();
                            verifyOTP(context, widget.phoneNumber, int.parse(enteredOtp));
                            // then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpdateProfile())));
                      },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width*.8,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                          child: Text(
                            "CONTINUE",
                            style: KAppTheme.darkTheme.textTheme.titleSmall,
                          )),
                    ),
                  ),
                ),
              ]
          )
      )
    );
  }

}
