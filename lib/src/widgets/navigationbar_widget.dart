import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigationbar_provider.dart';

class NavigationBarWidget extends StatelessWidget {
  final xColorIconoBoton = Color.fromRGBO(181, 194, 209, 1.0);
  final xColorIconoFondo = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    final xNavigationBarProvider = Provider.of<NavigationBarProvider>(context);
    final yCurrentIndex = xNavigationBarProvider.SelectMenuOpt;

    return CurvedNavigationBar(
        index: yCurrentIndex,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: xColorIconoFondo!,
        color: xColorIconoBoton,
        onTap: (int i) {
          xNavigationBarProvider.SelectMenuOpt = i;
        },
        items: [
          Icon(Icons.home_filled, color: Colors.black, size: 30),
          Icon(
            Icons.settings,
            color: Colors.black,
            size: 30,
          )
        ]);
    /*
    return BottomNavigationBar(
        onTap: (int i) {
          xNavigationBarProvider.SelectMenuOpt = i;
        },
        currentIndex: yCurrentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: xColorIconoBoton),
              label: 'Dispositivos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet, color: xColorIconoBoton),
              label: 'Mi cuenta')
        ]);
      */
  }
}
