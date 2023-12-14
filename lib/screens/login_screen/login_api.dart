import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> login(String phoneNumber) async {

  Uri url = Uri.parse(
      "https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/signIn");

  Map<String, String> headers = {"Content-type": "application/json"};
  Map<String, dynamic> body = {"mobile": phoneNumber};

  try {
    http.Response response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 1000) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print("Otp sent");
      print("Response body: ${responseBody}");
    } else {
      // Handle unsuccessful login response
      print("Login failed");
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  } catch (error) {
    // Handle network or other errors
    print("Error during login: $error");
  }

}
