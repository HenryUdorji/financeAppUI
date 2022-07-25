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
    return Scaffold(
      backgroundColor: color.Colors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            TopSection()
          ],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: color.Colors.backgroundColor,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          height: 300,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          height: 180,
          decoration: BoxDecoration(
              color: color.Colors.accentColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)
              )
          ),
        ),
        Positioned(child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Image.asset('assets/images/man.png', width: 40, height: 40, alignment: Alignment.topLeft,)),
              Image.asset('assets/images/search.png', width: 25, height: 25, color: Colors.white,),
              const SizedBox(width: 20,),
              Image.asset('assets/images/bell.png', width: 25, height: 25, color: Colors.white,)
            ],
          ),
        ),),
        Positioned(
          top: 80,
          child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Available Balance'),
                        Text('18645')
                      ],
                    ),
                    Image.asset('assets/images/man.png', width: 40, height: 40,),
                  ],
                )
              ],
            )
          ),
        ),
      ],
    );
  }
}

