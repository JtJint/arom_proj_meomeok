// import 'dart:html';

import 'package:arom_proj_meomeok/Screens/main_Screen.dart';
import 'package:arom_proj_meomeok/Service/API_Service.dart';

import 'package:flutter/material.dart';
import 'dart:math';

// ignore: camel_case_types
int idx = 0;

class Conversation_ extends StatefulWidget {
  const Conversation_({super.key, required List<String> FilterId});
  @override
  State<Conversation_> createState() => _Conversation_State();
}

class _Conversation_State extends State<Conversation_> {
  late List conver_list = [];
  late List<dynamic> menu_list = [];
  late List prt_menu = ['a'];

  void initState() {
    conver_list = [];
    menu_list = [];
    conver_list.add('오늘 머먹지...?');
  }

  void converReSt() {
    print(filter_id);
    // idx += 2;
    setState(
      () {
        converState(menu_list, prt_menu);
      },
    );
  }

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    initState();
    bool decide = false;
    return Column(
      children: [
        Container(
          width: 430,
          height: 330,
          color: Colors.lightBlue.shade100,
          child: FutureBuilder(
              future: Make_menus(menu_list, prt_menu),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return Center(
                    child: Container(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    ),
                  );
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
                    FutureBuilder(
                        future: fectch(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == true) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                  child: Text(
                                    prt_menu[0] == 'error'
                                        ? '다시 버튼을 눌러주세요'
                                        : '오늘은 ${prt_menu[0]} 어때요?',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  child: const Text(
                                    '....',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                  ]);
                }
              }),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                decoration: BoxDecoration(
                    // ignore: dead_code
                    color: decide ? Colors.blueAccent : Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 45,
                          blurStyle: BlurStyle.inner)
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(23),
                        bottomRight: Radius.circular(23),
                        topRight: Radius.circular(23))),
                child: const Text(
                  '결정!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                )),
          ),
          GestureDetector(
            onTap: converReSt,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: const BoxDecoration(
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
              child: const Text(
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

String rand_rt(List menuList, List prt_menu) {
  int a = menuList.length;

  int randA = Random().nextInt(a) + 456;
  // int randA = 465;
  print(randA);
  bool key = true;
  print(filter_id);
  for (int i = 0; i < menuList.length; i++) {
    if (menuList[i][0] == randA) {
      for (int j = 2; j < menuList[i].length; j += 2) {
        for (int q = 0; q < filter_id.length; q++) {
          if (menuList[i][j].contains(filter_id[q])) {
            key = !key;
            break;
          }
        }
        if (key == false) break;
      }
      if (!key) {
        randA = Random().nextInt(a) + 456;
        continue;
      } else if (key == true) {
        print(menuList[i]);
        return menuList[i][1];
      }
    }
  }
  return rand_rt(menuList, prt_menu);
}

Future<String> fectch() async {
  await Future.delayed(Duration(seconds: 1));
  return 'a';
}

Future<List<dynamic>> Make_menus(menu_list, prt_menu) async {
  await API_service.Quest_menu(menu_list);
  prt_menu[0] = (converState(menu_list, prt_menu));
  print(prt_menu);

  return menu_list;
}

String converState(menu_list, prt_menu) {
  String a = rand_rt(menu_list, prt_menu);
  return a;
}
