import 'package:flutter/material.dart';

import '../../utilis/theme/custom_themes/text_theme.dart';

class Page3 extends StatelessWidget {
  const Page3({
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
              "Interaction With Grid",
              style: !isDarkMode
                  ? KTextTheme.lightTextTheme.headlineSmall
                  : KTextTheme.darkTextTheme.headlineSmall,
            )),
        Text(
          "RealTime",
          style: !isDarkMode
              ? KTextTheme.lightTextTheme.headlineMedium
              : KTextTheme.darkTextTheme.headlineMedium,
        ),
        Text("Monitoring",
            style: KTextTheme.orangeTextTheme.headlineMedium),
        const SizedBox(height: 30,),
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Image.asset(
              "assets/images/grid.png",
              fit: BoxFit.cover),
        ),
        Text(
          "Intelligent Sensible Devices\n Ambicharge Services",
          textAlign: TextAlign.center,
          style: !isDarkMode
              ? KTextTheme.lightTextTheme.headlineSmall
              : KTextTheme.darkTextTheme.headlineSmall,
        )
      ],
    );
  }
}