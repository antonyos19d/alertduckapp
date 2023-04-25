import 'package:alertduckapp/src/widgets/login_button_widget.dart';
import 'package:alertduckapp/src/widgets/login_textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatefulWidget {
  final Function()? xOnTap;
  RegisterPage({super.key, required this.xOnTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (passwordController.text == passwordConfirmController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text);
        Navigator.pop(context);
      } else {
        //show error message, password don't match
        Navigator.pop(context);
        wrongErrorMessage('No coinciden los passwords!!');
      }
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
                    size: 70,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Crear una cuenta',
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  LoginTextfieldWidget(
                      xController: usernameController,
                      xHintText: 'username',
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
                  LoginTextfieldWidget(
                      xController: passwordConfirmController,
                      xHintText: 'Confirm Password',
                      xObscureText: true),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LoginButtonWidget(
                    xLabelButton: 'Sign Up',
                    xOnTap: signUserUp,
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
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200]),
                    child: Image.asset('lib/images/gogle_img.png', height: 80),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ya tengo una cuenta?',
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: widget.xOnTap,
                        child: Text(
                          'Iniciar Sesión',
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
