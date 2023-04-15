import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigationbar_provider.dart';

class CustomNavigationBarWidget extends StatelessWidget {
  final xColorIconoBoton = Color.fromRGBO(115, 115, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    final xNavigationBarProvider = Provider.of<NavigationBarProvider>(context);
    final yCurrentIndex = xNavigationBarProvider.SelectMenuOpt;

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
  }
}
