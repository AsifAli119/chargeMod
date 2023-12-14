import 'package:chargemod_asif/screens/ActivityScreen/activity_screen.dart';
import 'package:chargemod_asif/screens/HomeScreen/homescreen.dart';
import 'package:chargemod_asif/screens/login_screen/update_profile/updateProfile.dart';
import 'package:chargemod_asif/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../NavigationBar/navigationbar.dart';
import '../communityScreen/community_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavigationBar(context),
      body: Column(
        children: [
          Center(child: Text("Home"))
        ],
      )
    );
  }

}
