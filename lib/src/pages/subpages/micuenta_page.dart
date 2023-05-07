import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MicuentaPage extends StatelessWidget {
  final xUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
      body: Center(child: Text('MI CUENTA: ' + xUser.email!)),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
