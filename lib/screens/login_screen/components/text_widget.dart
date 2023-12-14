import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilis/theme/theme.dart';
import '../../otp_screen/otp_screen.dart';
import '../bloc/login_bloc.dart';

class TextFieldWidget extends StatefulWidget {
  String phoneNumber;
  Country selectedCountry ;
  TextFieldWidget({Key? key, required this.selectedCountry, required this.phoneNumber}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    !isDarkMode ? KAppTheme.lightTheme : KAppTheme.lightTheme;
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: !isDarkMode ? Colors.black45: Colors.white70,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: const CountryListThemeData(
                          bottomSheetHeight: 600,
                        ),
                        onSelect: (value) {
                          print("Selected Country: $value");
                          setState(() {
                            widget.selectedCountry = value;
                          });
                          print("Updated selectedCountry: $widget.selectedCountry");
                        },
                      );
                    },
                    child: Text(
                      "${widget.selectedCountry.flagEmoji ?? ""} ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 55.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 5.0),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        cursorHeight: 30,
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (phoneController.text.length!=10 || value!.isEmpty) {
                            return 'Please Enter a Valid Mobile Number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.phone),
                          errorStyle: const TextStyle(fontSize: 10.0),
                          hintText: "Enter Mobile Number",
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: InkWell(
            onTap: () {
              print("Form key: $formKey");
              print("Form state: ${formKey.currentState}");
              if (formKey.currentState!.validate()) {
                BlocProvider.of<LoginBloc>(context)
                    .add(LoginGenerateOtpEvent(phoneController.text));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => OtpScreen(
                    phoneNumber: phoneController.text)));
              }
            },
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                  child: Text(
                    "Send OTP",
                    style: KAppTheme.darkTheme.textTheme.titleSmall,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
