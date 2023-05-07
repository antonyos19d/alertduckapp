import 'package:alertduckapp/src/services/google_auth_service.dart';
import 'package:alertduckapp/src/widgets/login_button_google_widget.dart';
import 'package:alertduckapp/src/widgets/login_button_widget.dart';
import 'package:alertduckapp/src/widgets/login_textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  final Function()? xOnTap;
  LoginPage({super.key, required this.xOnTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userEmailController = TextEditingController();

  final passwordController = TextEditingController();

  signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //mensaje de error
      wrongErrorMessage(e.code);
    }
  }

  void wrongErrorMessage(String xMensaje) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(xMensaje),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Bienvenido',
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  LoginTextfieldWidget(
                      xController: userEmailController,
                      xHintText: 'Email',
                      xObscureText: false),
                  SizedBox(
                    height: 10,
                  ),
                  LoginTextfieldWidget(
                      xController: passwordController,
                      xHintText: 'password',
                      xObscureText: true),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Olvidé mi contraseña?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LoginButtonWidget(
                    xLabelButton: 'Sign In',
                    xOnTap: signUserIn,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[500],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('O continuar con'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  LoginButtonGoogleWidget(
                      xRuta: 'lib/images/gogle_img.png',
                      xOnTap: (() => GoogleAuthService().signInWithGoogle())),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No tienes cuenta?',
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: widget.xOnTap,
                        child: Text(
                          'Registrate Ahora',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
