import 'dart:async';

import 'package:chargemod_asif/screens/onboarding/onbording_screen.dart';
import 'package:chargemod_asif/utilis/theme/custom_themes/text_theme.dart';
import 'package:chargemod_asif/utilis/theme/theme.dart';
import 'package:flutter/material.dart';

import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5000),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>  OnboardingScreen()));
    });
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this
    )..addListener(() {
      setState(() {

      });
    });

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.repeat(reverse: false,);
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:isDarkMode ? Colors.black : Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
          ),
          Stack(
            children: [
              Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'charge',
                      style: !isDarkMode ?KTextTheme.lightTextTheme.headlineMedium : KTextTheme.darkTextTheme.headlineMedium,
                    ),
                    Text(
                      'MOD',
                      style: KTextTheme.orangeTextTheme.headlineMedium,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 115,
                left: 195,
                child: Text(
                  'POWER TO PEOPLE',
                  style: KTextTheme.orangeTextTheme.labelMedium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
            child: LinearProgressIndicator(
              value: _animation.value,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Connecting to chargeMOD",
              style: !isDarkMode ? KTextTheme.lightTextTheme.labelMedium : KTextTheme.darkTextTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
