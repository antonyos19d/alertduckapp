import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  //gogle sign In
  signInWithGoogle() async {
    //interactuar con el modulo de gogle para logeo
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtenemos los datos de autenticacion
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //creamos las credenciales para el nuevo usuario
    final credencial = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //finalmente, logear
    return await FirebaseAuth.instance.signInWithCredential(credencial);
  }
}
