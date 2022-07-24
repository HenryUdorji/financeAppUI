import 'package:flutter/material.dart';
import 'package:finance_app_ui/colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.Colors.backgroundColor,
      child: const Center(
        child: Text('Finance UI', style: TextStyle(fontFamily: 'Nunito', fontSize: 25, color: Colors.black),),
      ),
    );
  }
}
