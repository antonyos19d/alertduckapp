import 'package:alertduckapp/src/pages/contenedor_page.dart';
import 'package:alertduckapp/src/pages/login_page.dart';
import 'package:alertduckapp/src/providers/navigationbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

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
        initialRoute: 'login',
        routes: {
          'contenedor': (BuildContext context) => ContenedorPage(),
          'login': (BuildContext context) => LoginPage()
        },
      ),
    );
  }
}
