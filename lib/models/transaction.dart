import 'dart:math';

import 'package:flutter/material.dart';
import 'package:finance_app_ui/colors.dart' as color;

class Transaction {
  String title;
  String amount;
  String date;
  IconData iconData;
  Color color;

  Transaction(this.title, this.amount, this.date, this.iconData, this.color);
}

List<Transaction> transactions() {
  return [
    Transaction('Food', '\$450', '14 April 2019', Icons.fastfood_rounded, color.Colors.orangeColor),
    Transaction('Medicine', '\$4500', '14 April 2019', Icons.medical_information_rounded, color.Colors.greenColor),
    Transaction('Clothes', '\$45', '14 April 2019', Icons.shop, color.Colors.accentColor),
    Transaction('House', '\$45050', '10 May 2022', Icons.house_rounded, randomColor()),
    Transaction('Car Rental', '\$1650', '14 April 2019', Icons.car_rental_rounded, randomColor())
  ];
}

Color randomColor() {
  return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
}
