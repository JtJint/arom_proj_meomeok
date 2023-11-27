// import 'dart:html';

import 'dart:ffi';

import 'package:flutter/material.dart';

class selectScreen extends StatelessWidget {
  const selectScreen({super.key});

  @override
  final _black = Colors.black;
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    //추후 이미지 대치로 바꿀 예정
                    '머먹',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
          body: Column(children: [
            SizedBox(
              height: 35,
            ),
            Container(
              color: Colors.white,
              width: 410,
              height: 35,
              child: Row(
                children:[
                  SizedBox(
                    width: 20,
                  ),
                  Text('오늘 이거 어때요?',
                    style: TextStyle(color: Colors.black, fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container( height:2.0,
                    width:230,
                    color:Colors.black,)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: 410,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //List
                    children: [
                      Text('이미지 들어갈건지...?'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('음식 이름',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),


                ]
            ),
            Container( height:2.0,
              width:370,
              color:Colors.black,),
            // - - - 이거 만들어야함. 공부좀 해보고 생각해보고 만들어보자잇!
            SizedBox(
              height: 60,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: TextButton(
                      style: ButtonStyle(
                          side: MaterialStatePropertyAll(
                              BorderSide(style: BorderStyle.solid)),
                          foregroundColor: MaterialStatePropertyAll(Colors.white30)),
                      onPressed: () => print('gg'),
                      child: Text(
                        '다시 돌리기',
                        style: TextStyle(color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                    ),

                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: TextButton(
                      style: ButtonStyle(
                          side: MaterialStatePropertyAll(
                              BorderSide(style: BorderStyle.solid)),
                          foregroundColor: MaterialStatePropertyAll(Colors.white30)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '메인으로',
                        style: TextStyle(color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),

                  )
                ]
            )
          ]),
        ));
  }
}


