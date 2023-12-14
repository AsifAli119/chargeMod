import 'package:flutter/material.dart';

import '../../NavigationBar/navigationbar.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavigationBar(context),
      body: Center(child: Text("Activity Screen")),
    );
  }
}
