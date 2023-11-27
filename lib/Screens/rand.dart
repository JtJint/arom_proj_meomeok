import 'dart:math';

import 'package:arom_proj_meomeok/Screens/main_Screen.dart';
import 'package:arom_proj_meomeok/models/conversation.dart';
import 'package:flutter/material.dart';

class randScreen extends StatefulWidget {
  const randScreen({super.key});

  @override
  State<randScreen> createState() => _randScreenState();
}

class _randScreenState extends State<randScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => mainScreen()));
            },
            icon: Image.asset('assets/logo.png'),
            iconSize: 65,
          ),
          // SizedBox(
          //   width: 20,
          // )
        ],
        elevation: 0,
      ),
      body: Conversation_(),
    ));
  }
}