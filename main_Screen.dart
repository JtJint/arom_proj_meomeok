// import 'dart:html';

import 'dart:ffi';

import 'package:arom_proj_meomeok/Screens/select_Screen.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              // Text(
              //   //추후 이미지 대치로 바꿀 예정
              //   '머먹',
              //   style: TextStyle(color: Colors.black, fontSize: 20),
              // ),
              SizedBox(
                width: 13,
              ),
              Container(
                  width: 250,//범위 넘어가서 잠깐 바꾼 부분
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black))),
                  child: SearchBar(
                    leading: Icon(
                      Icons.search,
                      color: _black,
                    ),
                    hintText: "오늘은 머먹지..?",
                    hintStyle:
                        MaterialStatePropertyAll(TextStyle(color: Colors.grey)),
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(color: Colors.black, fontSize: 13)),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shadowColor: MaterialStatePropertyAll(Colors.white),
                    elevation: MaterialStatePropertyAll(0),
                    overlayColor:
                        MaterialStatePropertyAll(Colors.blueAccent.shade200),
                    shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  )),
              SizedBox(
                width: 13,
              ),
              IconButton(
                  onPressed: () {
                    print('Tap!');
                  },
                  icon: Icon(
                    Icons.format_list_bulleted_rounded,
                    color: Colors.black,
                  )),
            ],
          )
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.green,
              width: 410,//범위 넘어가서 잠깐 바꾼 부분
              height: 300,
              child: Column(
                //List
                children: [
                  Text('이미지 들어갈건지...?'),
                  Text('이미지라면 어떤 이미지가...?'),
                  Text('들어갈거 알려주면 그걸로 List만들고 밑에 하단에 어디 탭인지 알수 있어용..!'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        // - - - 이거 만들어야함. 공부좀 해보고 생각해보고 만들어보자잇!
        SizedBox(
          height: 30,
        ),
        Container(
          // padding: EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      line_one(
                          Icons.food_bank_outlined,
                          Icons.food_bank_outlined,
                          Icons.food_bank_outlined,
                          Icons.food_bank_outlined,
                          true) // 한 라인 이미지 만드는 메소드 하나로 만들수 있기는 한데 귀찮음. 걍 이렇게 만듦.,
                      ,
                      line_one(
                          Icons.food_bank_outlined,
                          Icons.food_bank_outlined,
                          Icons.food_bank_outlined,
                          Icons.food_bank_outlined,
                          false),
                    ],
                  ),
                )
              ],
            )
          ]),
        ),

        SizedBox(
          height: 10, //범위 넘어가서 잠깐 바꾼 부분
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ElevatedButton(
            style: ButtonStyle(
                side: MaterialStatePropertyAll(
                    BorderSide(style: BorderStyle.solid)),
                foregroundColor: MaterialStatePropertyAll(Colors.white30)),
            onPressed: () {// 버튼을 눌렀을 때 다른 화면으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => selectScreen()),
              );
            },
            child: Text(
              '랜덤 돌리기',
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ]),
    ));
  }

  Row line_one(IconData image1, IconData image2, IconData image3,
      IconData image4, bool top) {
    return Row(
      children: [
        main_icons(
          image1: image1,
          number: 1,
          top: top,
        ),
        main_icons(
          image1: image2,
          number: 2,
          top: top,
        ),
        main_icons(
          image1: image3,
          number: 3,
          top: top,
        ),
        main_icons(
          image1: image4,
          number: 4,
          top: top,
        ),
      ],
    );
  }
}

class main_icons extends StatefulWidget {
  main_icons({
    super.key,
    required this.image1,
    required this.number,
    required this.top,
  });
  final IconData image1;
  var number;
  var top;

  @override
  State<main_icons> createState() => _main_iconsState();
}

class _main_iconsState extends State<main_icons> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        check = !check;
        print(check);
      }),
      child: Container(
        decoration: BoxDecoration(
            color: check ? Colors.white : Colors.grey,
            borderRadius: widget.top
                ? (widget.number == 1
                    ? BorderRadius.only(topLeft: Radius.circular(12))
                    : widget.number == 4
                        ? BorderRadius.only(topRight: Radius.circular(12))
                        : null)
                : (widget.number == 1
                    ? BorderRadius.only(bottomLeft: Radius.circular(12))
                    : widget.number == 4
                        ? BorderRadius.only(bottomRight: Radius.circular(12))
                        : null),
            border: Border.all(color: Colors.black)),
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            Icon(
              widget.image1,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
