import 'package:flutter/material.dart';

import '../../NavigationBar/navigationbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavigationBar(context),
      body: Center(child: Text("HomeScreen")),
    );
  }
}
