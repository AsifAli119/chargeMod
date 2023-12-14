import 'package:flutter/material.dart';
class ProfileUpdateTextWidget extends StatelessWidget {
  const ProfileUpdateTextWidget({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: TextField(
        cursorHeight: 30,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}