import 'package:arom_proj_meomeok/Screens/main_Screen.dart';
import 'package:arom_proj_meomeok/models/example..g.dart';
import 'package:arom_proj_meomeok/models/widget/class/API.dart';

import 'package:flutter/material.dart';
import 'dart:math';

// ignore: camel_case_types
class Conversation_ extends StatefulWidget {
  const Conversation_({super.key, required List<String> FilterId});
  @override
  State<Conversation_> createState() => _Conversation_State();
}

int a = 0;
List<MenuModel> menu_list = [];
List<String> prt_menu = ['a'];

class _Conversation_State extends State<Conversation_> {
  late List conver_list = [];
  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names

  @override
  void initState() {
    conver_list = [];
    menu_list = [];
    conver_list.add('오늘 머먹지...?');
    // Make_menus(prt_menu);
  }

  @override
  void converReSt() {
    setState(
      () {
        // print(prt_menu[0]);
        rand_rt(prt_menu);
      },
    );
  }

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
              future: Make_menus(prt_menu),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return const Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: const CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Error : ${snapshot.error}',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  return Column(children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Text(
                            '${conver_list[0]}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        )
                      ],
                    ),
                    const SizedBox(
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
                                const SizedBox(
                                  width: 18,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
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
                                  padding: const EdgeInsets.all(5),
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
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: BoxDecoration(
                // ignore: dead_code
                color: decide ? Colors.blueAccent : Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      blurStyle: BlurStyle.inner),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                  topRight: Radius.circular(23),
                ),
              ),
              child: const Text(
                '결정!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: converReSt,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    blurStyle: BlurStyle.inner,
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                  topRight: Radius.circular(23),
                ),
              ),
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

Future<String> Make_menus(prt_menu) async {
  menu_list = await API_service.Quest_menu(menu_list);
  a = menu_list.length;
  prt_menu[0] = rand_rt(prt_menu);
  return 'a';
}

String rand_rt(List<String> prt_menu) {
  String rt = 'a';
  int randA = Random().nextInt(a);
  bool key = true;
  for (int i = 0; i < menu_list[randA].filterDtos!.length; i++) {
    for (int j = 0; j < filter_id.length; j++) {
      if (filter_id[j] == menu_list[randA].filterDtos![i].id.toString()) {
        print(menu_list[randA].filterDtos![i].id);
        key = false;
        break;
      }
    }
    if (key == false) {
      break;
    }
  }
  if (key == false) {
    rand_rt(prt_menu);
  } else {
    rt = menu_list[randA].name!;
    return rt;
  }
  throw Error();
}

// ignore: camel_case_types

Future<String> fectch() async {
  await Future.delayed(Duration(seconds: 1));
  return 'a';
}
