import 'package:flutter/material.dart';

import '../../utilis/theme/custom_themes/text_theme.dart';
class page2 extends StatelessWidget {
  const page2({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
            child: Text(
              "Easy Ev Navigation",
              style: !isDarkMode
                  ? KTextTheme.lightTextTheme.headlineSmall
                  : KTextTheme.darkTextTheme.headlineSmall,
            )),
        Text(
          "Travel Route",
          style: !isDarkMode
              ? KTextTheme.lightTextTheme.headlineMedium
              : KTextTheme.darkTextTheme.headlineMedium,
        ),
        Text("For Electrics",
            style: KTextTheme.orangeTextTheme.headlineMedium),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Image.asset(
              !isDarkMode
                  ? "assets/images/maplightscreen.png"
                  : "assets/images/maplightscreen.png",
              fit: BoxFit.cover),
        ),
        const SizedBox(height: 20,),
        Text(
          "Grab The Best in Class\n Digital Experience Crafted For\n EV Drivers",
          textAlign: TextAlign.center,
          style: !isDarkMode
              ? KTextTheme.lightTextTheme.headlineSmall
              : KTextTheme.darkTextTheme.headlineSmall,
        )
      ],
    );
  }
}