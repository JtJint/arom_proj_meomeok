// import 'dart:html';

import 'package:flutter/material.dart';

class Conversation_ extends StatefulWidget {
  const Conversation_({
    super.key,
  });
  @override
  State<Conversation_> createState() => _Conversation_State();
}

class _Conversation_State extends State<Conversation_> {
  List conver_list = [];
  List menu_list = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      // if(menu_list == 0) {
      //   menu_list.add()
      // }
      if (conver_list.length == 0) {
        conver_list.add(['오늘 머먹지...?', true]);
        // conver_list.add(['오늘 메뉴 테마는 ${tema}로 ${menu} 어뗴요?', false]);
      }
    });
    bool decide = false;
    bool rerole = false;
    return Column(
      children: [
        Container(
          width: 430,
          height: 530,
          color: Colors.grey,
          child: SingleChildScrollView(child: Text('${conver_list}')),
        ),
        SizedBox(
          height: 30,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
            onTap: () {
              return setState(() {
                if (decide == false) decide = true;
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                decoration: BoxDecoration(
                    color: decide ? Colors.blueAccent : Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 45,
                          blurStyle: BlurStyle.inner)
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(23),
                        bottomRight: Radius.circular(23),
                        topRight: Radius.circular(23))),
                child: Text(
                  '결정!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                )),
          ),
          GestureDetector(
            onTap: () => print('list.add'),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 45,
                        blurStyle: BlurStyle.inner)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(23),
                      bottomRight: Radius.circular(23),
                      topRight: Radius.circular(23))),
              child: Text(
                '다시!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ]),
      ],
    );
  }
}
