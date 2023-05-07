import 'package:flutter/material.dart';

class SensorTextfieldWidget extends StatelessWidget {
  final xController;
  final String xHintText;
  final bool xObscureText;

  const SensorTextfieldWidget(
      {super.key,
      required this.xController,
      required this.xHintText,
      required this.xObscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: xController,
        obscureText: xObscureText,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: xHintText),
      ),
    );
  }
}
