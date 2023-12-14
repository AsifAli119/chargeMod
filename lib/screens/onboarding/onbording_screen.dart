import 'package:chargemod_asif/screens/login_screen/login_screen.dart';
import 'package:chargemod_asif/screens/onboarding/page1.dart';
import 'package:chargemod_asif/screens/onboarding/page2.dart';
import 'package:chargemod_asif/screens/onboarding/page3.dart';
import 'package:chargemod_asif/utilis/theme/custom_themes/text_theme.dart';
import 'package:chargemod_asif/utilis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = currentPage+1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    !isDarkMode ? KAppTheme.lightTheme : KAppTheme.lightTheme;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            TextButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
                child: Text("SKIP",
                    style: !isDarkMode
                        ? KTextTheme.lightTextTheme.labelLarge
                        : KTextTheme.darkTextTheme.labelLarge)),
          ],
        ),
        body: PageView(controller: pageController,
            children: [
          Page1(isDarkMode: isDarkMode),
          page2(isDarkMode: isDarkMode),
          Page3(isDarkMode: isDarkMode),
        ]),
        bottomSheet: Container(
          color: Colors.transparent,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage != 0
                  ? IconButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.orange)),
                      onPressed: ()=> pageController.jumpToPage(currentPage-1),
                      icon: const Icon(
                        Icons.arrow_left,
                        color: Colors.white,
                      ))
                  : const SizedBox(),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: ScrollingDotsEffect(
                  dotColor: !isDarkMode
                      ? Colors.black.withOpacity(0.7)
                      : Colors.white.withOpacity(0.7),
                  activeDotColor: !isDarkMode ? Colors.black : Colors.white,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                ),
                onPressed: () {
                  if (currentPage >=2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  } else {
                    pageController.jumpToPage(currentPage + 1);
                    print(currentPage);
                  }
                },
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
              )

            ],
          ),
        ));
  }
}






