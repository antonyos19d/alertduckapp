
import 'package:alertduckapp/src/pages/subpages/micuenta_page.dart';
import 'package:alertduckapp/src/pages/subpages/dispositivos_page.dart';
import 'package:alertduckapp/src/providers/navigationbar_provider.dart';
import 'package:alertduckapp/src/widgets/navigationbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContenedorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _HomePageBody()),
      bottomNavigationBar: CustomNavigationBarWidget(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final xNavigationBarProvider = Provider.of<NavigationBarProvider>(context);
    int i = xNavigationBarProvider.SelectMenuOpt;

    switch (i) {
      case 0:
        return DispositivosPage();
        break;
      case 1:
        return MicuentaPage();
        break;
      default:
        return DispositivosPage();
    }
  }
}
