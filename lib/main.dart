import 'package:alertduckapp/src/pages/auth_page.dart';
import 'package:alertduckapp/src/pages/contenedor_page.dart';
import 'package:alertduckapp/src/pages/register_sensor_page.dart';
import 'package:alertduckapp/src/providers/navigationbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => new NavigationBarProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AlertDuckApp',
        initialRoute: 'auth',
        routes: {
          'contenedor': (BuildContext context) => ContenedorPage(),
          'auth': (BuildContext context) => AuthPage(),
          'registerSensor': (BuildContext context) => RegisterSensorPage()
        },
      ),
    );
  }
}
