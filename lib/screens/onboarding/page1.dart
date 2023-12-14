import 'package:flutter/material.dart';

import '../../utilis/theme/custom_themes/text_theme.dart';
class Page1 extends StatelessWidget {
  const Page1({
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
              "Charge Your EV",
              style: !isDarkMode
                  ? KTextTheme.lightTextTheme.headlineSmall
                  : KTextTheme.darkTextTheme.headlineSmall,
            )),
        Text(
          "At Your",
          style: !isDarkMode
              ? KTextTheme.lightTextTheme.headlineMedium
              : KTextTheme.darkTextTheme.headlineMedium,
        ),
        Text("Fingertips",
            style: KTextTheme.orangeTextTheme.headlineMedium),
        SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                    isDarkMode
                        ? "assets/images/vehicle2.png"
                        : "assets/images/darkVehicle.png",
                    fit: BoxFit.cover),
              ),
            ],
          ),
        )
      ],
    );
  }
}