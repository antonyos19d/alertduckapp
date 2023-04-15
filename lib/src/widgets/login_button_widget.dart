import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function()? xOnTap;

  const LoginButtonWidget({super.key, required this.xOnTap});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: xOnTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          'Sign In',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    );
  }
}
