import 'dart:convert';
import 'package:chargemod_asif/screens/ProfileScreen/profile.dart';
import 'package:chargemod_asif/screens/login_screen/update_profile/updateProfile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<bool> verifyOTP(BuildContext context, String mobileNumber, int otp) async {
  final Uri apiUrl = Uri.parse('https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/verify',);

  final http.Response response = await http.post(
    apiUrl,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'mobile': mobileNumber,
      'otp': otp,
    }),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> result = json.decode(response.body);

    if (result['feasibilityStatus'] == true) {
      bool isNewUser = result['data']['isNewUser'];
      print(isNewUser);
      if(isNewUser == false){
        Navigator.push(
         context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
      }else{
        Navigator.push(
            context, MaterialPageRoute(builder: (context)=> UpdateProfile()));
      }
      print('Verification successful');
      return true;
    } else {
      print('Verification failed. Reason: ${result['message']}');
      return false;
    }
  } else {
    // Handle API request failure
    print('API request failed with status code ${response.statusCode}');
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    return false;
  }
}
