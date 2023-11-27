import 'package:arom_proj_meomeok/Screens/main_Screen.dart';
import 'package:flutter/material.dart';

import 'Screens/select_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return mainScreen();
  }
}
