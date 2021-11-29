import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planthome/core/service_locator.dart' as di;
import 'package:planthome/views/login/presentacion/page/login_page.dart';

void main() async{
  await di.init();
  runApp(const MyAppPtMovil());
}

class MyAppPtMovil extends StatelessWidget {
  const MyAppPtMovil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Restringir el cambio de orientación
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return const MaterialApp(
      title: 'Proyecto Movil Home Plant',
      home: LoginPage(),
    );
  }
}