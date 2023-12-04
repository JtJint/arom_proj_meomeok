// import 'dart:html';

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// ignore: camel_case_types
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
  List prt_menu = [];
  int idx = 0;
  String filePath_K =
      '/Users/jeongjitae/Projects/arom_proj_meomeok/lib/models/Txt/korean';
  String filepath_W =
      '/Users/jeongjitae/Projects/arom_proj_meomeok/lib/models/Txt/western';
  String filepath_J = 'lib/models/Txt/japanes';
  String filepath_C = "lib/models/Txt/chinese";
  void initState() {
    conver_list = [];
    menu_list = [];
    conver_list.add('오늘 머먹지...?');
  }

  Future<List> Make_menus() async {
    menu_list.add(await readFile(filePath_K));
    menu_list.add(await readFile(filepath_W));
    prt_menu = [converState()];

    return menu_list;
  }

  List<String> converState() {
    List<String> a = rand_rt(menu_list);
    return a;
  }

  @override
  Widget build(BuildContext context) {
    initState();
    bool decide = false;
    return Column(
      //future build 실행부
      children: [
        Container(
          // cßontainer 에서 future build 실행해야함.
          width: 430,
          height: 330,
          color: Colors.lightBlue.shade100,
          child: FutureBuilder(
              future: Make_menus(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Error : ${snapshot.error}',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  return Column(children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Text(
                            '${conver_list[0]}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: Text(
                            '오늘은 ${prt_menu[0][0]}${prt_menu[0][1]}어때요?',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ]);
                }
              }),
        ),
        SizedBox(
          height: 50,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
            onTap: () {},
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
            onTap: () => setState(() {
              anotherMenu() {
                // conver_list.add(['다른거!', true]);
              }

              ;
            }),
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

List<String> rand_rt(List menu_list) {
  int a = 0;
  for (var each in menu_list) {
    for (var i in each) {
      // print('${i}, ${a}');
      a++;
    }
  }
  int rand_a = Random().nextInt(a);
  // print('${a}, ${rand_a}');
  a = 0;
  for (var each in menu_list) {
    for (var i in each) {
      if (a == rand_a) {
        // print('${a}, ${rand_a}, ${i}');
        return i;
      }
      a += 1;
    }
  }
  return ['error'];
}

Future<List<List<String>>> readFile(String filepath) async {
  File file = File("$filepath");
  if (!(await file.exists())) {
    print("file is null!");
    return [
      ['a']
    ];
  } else {
    List<List<String>> rt = [];
    List<String> lines = await file.readAsLines();
    for (var each in lines) {
      List<String> a = each.split(':');
      rt.add(a);
    }
    return rt;
  }
}
