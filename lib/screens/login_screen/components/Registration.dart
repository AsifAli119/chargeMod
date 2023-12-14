import 'package:chargemod_asif/screens/login_screen/components/text_widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilis/theme/custom_themes/text_theme.dart';
import '../../../utilis/theme/theme.dart';
import '../bloc/login_bloc.dart';

class RegisterScreen extends StatelessWidget {


  const RegisterScreen({
    super.key,
    required this.formKey,
    required this.isDarkMode,
    required this.phoneController,
    required this.selectedCountry,
  });

  final bool isDarkMode;
  final TextEditingController phoneController;
  final Country selectedCountry;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          ),
          Text(
            "ChargeMOD",
            style: !isDarkMode
                ? KTextTheme.lightTextTheme.headlineSmall
                : KTextTheme.darkTextTheme.headlineSmall,
          ),
          Text(
            "Let's Start",
            style: !isDarkMode
                ? KTextTheme.lightTextTheme.headlineMedium
                : KTextTheme.darkTextTheme.headlineMedium,
          ),
          Text("From Login", style: KTextTheme.orangeTextTheme.headlineMedium),
          const SizedBox(
            height: 30,
          ),
          TextFieldWidget(
              selectedCountry: selectedCountry,
          phoneNumber: phoneController.text,),

          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
          ),
          Column(
            children: [
              Text(
                "By Continuing you agree to our",
                style: !isDarkMode
                    ? KTextTheme.lightTextTheme.labelLarge
                    : KTextTheme.darkTextTheme.labelLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terms & Conditions",
                    style: KTextTheme.orangeTextTheme.labelLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "and",
                      style: !isDarkMode
                          ? KTextTheme.lightTextTheme.labelLarge
                          : KTextTheme.darkTextTheme.labelLarge,
                    ),
                  ),
                  Text("Privacy Policy",
                      style: KTextTheme.orangeTextTheme.labelLarge)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
