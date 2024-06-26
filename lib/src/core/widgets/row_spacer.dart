import 'package:flutter/material.dart';

class RowSpacer extends StatelessWidget {
  static const int _multiplier = 10;

  final double value;

  const RowSpacer(this.value, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(width: value * _multiplier);
}