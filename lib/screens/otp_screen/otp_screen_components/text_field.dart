import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox buildOtpTextField(TextEditingController controller) {
  return SizedBox(
      height: 50,
      width: 50,
      child: TextField(
        autofocus: true,
        maxLength: 1,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counter: const Offstage(),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(color: Colors.black),
          errorStyle: const TextStyle(fontSize: 10.0),
          hintStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ));
}
