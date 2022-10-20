import 'package:flutter/material.dart';
import 'package:finance_app_ui/colors.dart' as color;
import 'package:finance_app_ui/models/contacts.dart';
import 'package:finance_app_ui/models/transaction.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: color.Colors.accentColor,
        unselectedItemColor: color.Colors.disableColor,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stock'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cards'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              TopSection(),
              ContactSection(),
              SizedBox(
                height: 20,
              ),
              ActionSection(),
              SizedBox(
                height: 20,
              ),
              TransactionSection()
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionSection extends StatelessWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: textStyle.headline3,
              ),
              Text(
                'See all',
                style: textStyle.subtitle2,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: transactions().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: transactions()[index].color.withOpacity(0.2),
                              shape: BoxShape.circle
                          ),
                          child: Icon(transactions()[index].iconData, color: transactions()[index].color, size: 17,),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(transactions()[index].title, style: textStyle.bodyText1,),
                              Text(transactions()[index].date, style: textStyle.subtitle1,),
                            ],
                          ),
                        ),
                        Text(transactions()[index].amount, style: textStyle.bodyText2,),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class ActionSection extends StatelessWidget {
  const ActionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionItem(
              icon: Icons.add,
              color: color.Colors.accentColor,
              title: 'Add money'),
          ActionItem(
            icon: Icons.credit_card_outlined,
            color: color.Colors.orangeColor,
            title: 'Send Money',
          ),
          ActionItem(
            icon: Icons.dashboard_outlined,
            color: color.Colors.disableColor,
            title: 'More',
          )
        ],
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  const ActionItem(
      {Key? key, required this.icon, required this.color, required this.title})
      : super(key: key);
  final IconData icon;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30)),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: color.Colors.accentColor, shape: BoxShape.circle),
            child: Image.asset(
              'assets/images/search.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 40,
            width: 2,
            color: color.Colors.disableColor.withOpacity(0.3),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contacts().length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          contacts()[index].imageLink,
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        contacts()[index].name,
                        style: textStyle.bodyText2,
                      )
                    ],
                  ),
                );
              },
            ),
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
          height: 250,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          height: 150,
          decoration: BoxDecoration(
              color: color.Colors.accentColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Image.asset(
                'assets/images/man.png',
                width: 40,
                height: 40,
                alignment: Alignment.topLeft,
              )),
              Image.asset(
                'assets/images/search.png',
                width: 25,
                height: 25,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/bell.png',
                width: 25,
                height: 25,
                color: Colors.white,
              )
            ],
          ),
        ),
        Positioned(
          top: 80,
          left: 0,
          right: 0,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available Balance',
                            style: textStyle.subtitle1,
                          ),
                          Text(
                            '\$18,645',
                            style: textStyle.headline1,
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: 20,
                        child: Image.asset(
                          'assets/images/usa.png',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'See More',
                            style: textStyle.subtitle1,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color:
                                    color.Colors.accentColor.withOpacity(0.2),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 8,
                              color: color.Colors.accentColor,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'US Dollar',
                            style: textStyle.subtitle2,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: color.Colors.accentColor,
                          )
                        ],
                      )
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }
}
