import 'package:finance_app_ui/home.dart';
import 'package:flutter/material.dart';

import 'package:finance_app_ui/colors.dart' as color;
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color.Colors.accentColor,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
        textTheme: TextTheme(
          headline1: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          headline3: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText1: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText2: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: color.Colors.disableColor),
          subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: color.Colors.accentColor),
        )
      ),
      home: const HomePage(),
    );
  }
}
