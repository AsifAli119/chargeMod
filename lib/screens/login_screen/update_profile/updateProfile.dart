import 'package:chargemod_asif/utilis/theme/custom_themes/text_theme.dart';
import 'package:chargemod_asif/utilis/theme/theme.dart';
import 'package:flutter/material.dart';

import 'components/updateProfileTextWidget.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}
TextEditingController controller = TextEditingController();
class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(child: Text("Update Profile")),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("First Name"),
            ProfileUpdateTextWidget(controller: controller, hint: "First name"),
            SizedBox(height: 10,),
            Text("Last Name"),
            ProfileUpdateTextWidget(controller: controller, hint: "Last name"),
            SizedBox(height: 10,),
            Text("E-mail"),
            ProfileUpdateTextWidget(controller: controller, hint: "email"),
            SizedBox(height: 10,),
            Text("Phone Number"),
            Text(""),
            SizedBox(height: MediaQuery.of(context).size.height*.4,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Completing Your Profile", textAlign: TextAlign.center,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 08),
                  child: Text("This action will reflect in your activities and payments after saving. we ask for email details for recieving monthly activity and notifications.", style: TextStyle(fontSize: 09),),
                ),
                Container(
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange
                  ),
                  child: Center(child: Text("Save Changes")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}


