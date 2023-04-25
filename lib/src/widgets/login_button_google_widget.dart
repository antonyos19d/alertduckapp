import 'package:flutter/material.dart';

class LoginButtonGoogleWidget extends StatelessWidget {
  final String xRuta;
  final Function()? xOnTap;

  LoginButtonGoogleWidget(
      {Key? key, required this.xRuta, required this.xOnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: xOnTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200]),
        child: Image.asset(xRuta, height: 80),
      ),
    );
  }
}
