import 'package:flutter/material.dart';

class TransactionModel {
  final Widget widgetImg;
  final String title;
  final String subtitle;
  final String amountUp;
  final String amountDown;
  final String unity;
  final Color unityTextColor;
  final String time;
  final String status;
  final Color statusColor;
  final Color colorUp;
  final Color colorDown;

  TransactionModel({
    required this.widgetImg,
    required this.title,
    required this.subtitle,
    required this.amountUp,
    required this.amountDown,
    required this.unity,
    required this.unityTextColor,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.colorUp,
    required this.colorDown,
  });
}