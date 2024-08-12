// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Cards {
  int number;
  String clientName;
  Color cardColor;
  String totalBalance;
  String type;
  DateTime expiration;
  Cards({
    required this.number,
    required this.clientName,
    required this.cardColor,
    required this.totalBalance,
    required this.type,
    required this.expiration,
  });
}
