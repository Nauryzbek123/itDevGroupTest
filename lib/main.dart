import 'package:flutter/material.dart';
import 'package:test_proj/src/core/dependencies/getIt.dart';
import 'package:test_proj/src/features/app/my_app.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}
