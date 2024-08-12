import 'package:flutter/material.dart';

class Transactions {
  IconData icon;
  Color iconColor;
  String title;
  String? type;
  String amount;
  bool isWithdraw;
  Transactions({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.type,
    required this.amount,
    required this.isWithdraw,
  });
}