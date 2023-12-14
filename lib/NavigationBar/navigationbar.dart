import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../screens/ActivityScreen/activity_screen.dart';
import '../screens/HomeScreen/homescreen.dart';
import '../screens/ProfileScreen/profile.dart';
import '../screens/communityScreen/community_screen.dart';

NavigationBar buildNavigationBar(BuildContext context) {
  return NavigationBar(
    selectedIndex: 3,
    elevation: 0,
    onDestinationSelected: (index)=> _navigateToScreen(context, index),
    backgroundColor: Colors.white,
    destinations:const [
      NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
      NavigationDestination(icon: Icon(Iconsax.activity), label: "Activity"),
      NavigationDestination(icon: Icon(Iconsax.close_circle1), label: "Community"),
      NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
    ],
  );
}
void _navigateToScreen(BuildContext context, int index) {
  switch (index) {
    case 0:
    // Navigate to Home screen
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
      break;
    case 1:
    // Navigate to Activity screen
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CommunityScreen()));
      break;
    case 2:
    // Navigate to Community screen
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ActivityScreen()));
      break;
    case 3:
    // Navigate to Profile screen
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      break;
    default:
      break;
  }

}