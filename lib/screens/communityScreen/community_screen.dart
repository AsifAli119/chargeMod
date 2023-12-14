import 'package:flutter/material.dart';

import '../../NavigationBar/navigationbar.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavigationBar(context),
      body: Center(child: Text("Community Screen")),
    );
  }
}
