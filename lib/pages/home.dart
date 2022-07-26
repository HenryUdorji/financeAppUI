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
            TopSection(),
            ContactSection()
          ],
        ),
      ),
    );
  }
}

class Contacts {
  String name;
  String imageLink;

  Contacts.name({required this.name, required this.imageLink});
}

class ContactSection extends StatelessWidget {
  ContactSection({Key? key}) : super(key: key);

  final List<Contacts> contacts = [

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.Colors.accentColor,
              shape: BoxShape.circle
            ),
            child: Image.asset('assets/images/search.png', color: Colors.white, width: 30, height: 30,),
          ),
          Container(height: 50, width: 2, color: color.Colors.disableColor.withOpacity(0.9),),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return Container();
            },
          )
        ],
      ),
    );
  }
}


class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Image.asset('assets/images/man.png', width: 40, height: 40, alignment: Alignment.topLeft,)),
              Image.asset('assets/images/search.png', width: 25, height: 25, color: Colors.white,),
              const SizedBox(width: 20,),
              Image.asset('assets/images/bell.png', width: 25, height: 25, color: Colors.white,)
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Available Balance', style: textStyle.subtitle1,),
                        Text('\$18,645', style: textStyle.headline1,)
                      ],
                    ),
                    CircleAvatar(radius: 20, child:  Image.asset('assets/images/usa.png',),)
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('See More', style: textStyle.subtitle1,),
                        const SizedBox(width: 5,),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: color.Colors.accentColor.withOpacity(0.2),
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.arrow_forward_ios, size: 8, color: color.Colors.accentColor,),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('US Dollar', style: textStyle.subtitle2,),
                        Icon(Icons.arrow_drop_down, color: color.Colors.accentColor,)
                      ],
                    )
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

