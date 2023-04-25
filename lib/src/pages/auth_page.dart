import 'package:alertduckapp/src/pages/contenedor_page.dart';
import 'package:alertduckapp/src/pages/login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //redirige a pagina logeada
            if (snapshot.hasData) {
              return ContenedorPage();
            }
            //redirige a loginPage
            else {
              return LoginOrRegisterPage();
            }
          }),
    );
  }
}
