import 'package:arom_proj_meomeok/Screens/main_Screen.dart';
import 'package:arom_proj_meomeok/models/example..g.dart';
import 'package:arom_proj_meomeok/models/widget/class/API.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class Conversation_ extends StatefulWidget {
  const Conversation_({
    super.key,
    required List<String> FilterId,
  });
  @override
  State<Conversation_> createState() => _Conversation_State();
}

int a = 0;
List<MenuModel> menu_list = [];
List<String> prt_menu = ['a'];
String Bprt = prt_menu[0];
bool _FF = true;

class _Conversation_State extends State<Conversation_> {
  late List conver_list = [];
  final String _url = ('https://www.youtube.com/results?search_query=');
  late String purl = '';
  @override
  void initState() {
    conver_list = [];
    menu_list = [];
    conver_list.add('오늘 머먹지...?');
    // Make_menus(prt_menu);
  }

  @override
  Future<String> converReSt() async {
    String a = '';
    setState(
      () {
        rand_rt(prt_menu);
      },
    );
    return a;
  }

  @override
  Widget build(BuildContext context) {
    initState();
    bool decide = false;

    return Column(
      children: [
        FutureBuilder(
          future: Make_menus(prt_menu),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 243, 184, 36),
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
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 215, 132),
                        borderRadius: BorderRadius.circular(12),
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 243, 184, 36),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
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
                          future: fectch1(),
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
                                      color: Color.fromARGB(255, 251, 194, 50),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      prt_menu[0] == ''
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
                                      color: Color.fromARGB(255, 243, 184, 36),
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
                          },
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Button(decide),
                ],
              );
            }
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              FutureBuilder(
                future: __fectch(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    String _surl = _url + prt_menu[0] + '만드는 법';
                    String purl = prt_menu[0] + ' 만드는 법';
                    return GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(_surl));
                      },
                      child: num1(
                        '$purl 보러가기',
                        FontAwesomeIcons.youtube,
                        Colors.red,
                      ),
                    );
                  } else {
                    return Container(
                      child: Text('정보를 가져오는 중이에요'),
                    );
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Row Button(bool decide) {
    const border2 = Border(
      top: BorderSide(
        color: Colors.grey,
      ),
      bottom: BorderSide(
        color: Colors.grey,
      ),
      left: BorderSide(
        color: Colors.grey,
      ),
      right: BorderSide(
        color: Colors.grey,
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            decoration: BoxDecoration(
              // ignore: dead_code
              color: decide ? Colors.blueAccent : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
                topRight: Radius.circular(23),
              ),
              border: border2,
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
                topRight: Radius.circular(23),
              ),
              border: border2,
            ),
            child: const Text(
              '다시!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
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
  prt_menu = [];
  String rt = 'a';
  int randA = Random().nextInt(a);
  // await Future.delayed(Duration(milliseconds: 100));
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
    return rand_rt(prt_menu);
  } else {
    rt = menu_list[randA].name!;
    return rt;
  }
  // throw Error();
}

// ignore: camel_case_types

Future<String> fectch1() async {
  await Future.delayed(const Duration(milliseconds: 80));
  if (_FF) _FF = !_FF;
  return 'a';
}

Future<String> fectch2() async {
  await Future.delayed(const Duration(seconds: 1));
  if (_FF) _FF = !_FF;
  return 'a';
}

Future<void> _launchUrl(Uri _url) async {
  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}

Future<String?> __fectch() async {
  if (_FF == true) {
    _FF = !_FF;
  }
  await Future.delayed(
    const Duration(milliseconds: 480),
  );
  return 'a';
}

Container num1(String asdf, IconData _icon, Color _color) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      shape: BoxShape.rectangle,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _icon,
            color: _color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            asdf,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
