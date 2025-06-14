import 'package:flutter/material.dart';

class SoldeCardModel {
  final Color color;
  final Widget widgetImg;
  final String label;
  final String amount;
  final Color textColor;

  SoldeCardModel({
    required this.color,
    required this.widgetImg,
    required this.label,
    required this.amount,
    required this.textColor,
  });
}