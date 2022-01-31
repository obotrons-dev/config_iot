
import 'package:ap_config/mainpage/selectconfig.dart';
import 'package:flutter/material.dart';
import 'package:ap_config/mainpage//login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        // 'setting': (context) => ConfigAP(),
        'config': (context) => ConfigAP()
      },
    );
  }
}


