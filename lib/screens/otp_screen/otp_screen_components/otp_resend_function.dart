import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<void> resendOtp(String phoneNumber) async {
  const String apiUrl = 'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/resend';

  try {
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "mobile": phoneNumber,
        "type": "text", // or "voice" for Voice call
      }),
    );

    if (response.statusCode == 200) {
      // Success
      print('OTP resent successfully!');
      // Handle the success as needed
    } else {
      // Handle the error
      print('Error resending OTP - ${response.statusCode}');
      // Display an error message or take appropriate action
    }
  } catch (e) {
    // Handle the error
    print('Error resending OTP - $e');
    // Display an error message or take appropriate action
  }
}