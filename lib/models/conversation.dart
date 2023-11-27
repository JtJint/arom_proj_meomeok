// import 'dart:html';

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class Conversation_ extends StatefulWidget {
  const Conversation_({
    super.key,
  });
  @override
  State<Conversation_> createState() => _Conversation_State();
}

//내 가설은 뭐냐 지금 이게 상대 경로잖아 근데 이게 이미지도 내가 상대 경로로 넣었는데
// 이때는 확장을 해서 상대경로로 넣을수 있었는데 얘도 마찬가지 이지 않을까?
//내가 알기로는 여기서 안다른걸로 알아
class _Conversation_State extends State<Conversation_> {
  List conver_list = [];
  List menu_list = [];
  String filePath_K =
      '/Users/jeongjitae/Projects/arom_proj_meomeok/lib/models/Txt/korean';
  String filepath_W = "/Txt/western";
  String filepath_J = '/Txt/japanes';
  String filepath_C = "/Txt/chinese";
  // /Users/jeongjitae/Projects/arom_proj_meomeok/lib/models/conversation.dart
  List K_menu = [];
  List W_menu = [];
  List C_menu = [];
  List J_menu = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (menu_list.length == 0) {
        //아니 txt파일 list로 추출하고 싶은데 어찌해야하는 지 감도 안옴 ㅋㅋ
        // 웬만해선 json이용하세용
        K_menu.add(readFile(filePath_K));
        print(K_menu);
      }
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
          child:
              SingleChildScrollView(child: Text('${conver_list}, ${K_menu}')),
        ),
        SizedBox(
          height: 50,
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

class make_menu_Info {
  final String tema;
  final String menu;

  make_menu_Info(this.menu, this.tema);
  String toList() {
    return 'menu: ${this.menu} , tema: ${this.tema}';
  }
}

Future<List<String>> readFile(String filepath) async {
  // 이거 안되요?// 디버그는 찍어보셧나용//돌아는 가는데 이게 상태 갱신이 안댐
  File file = File("$filepath");
  List<String> lines = await file.readAsLines();
  List<make_menu_Info> menus = await lines.map((line) {
    List<String> parts = line.split(':');
    String tema = parts[0].trim();
    String menu = parts[1].trim();
    return make_menu_Info(tema, menu);
  }).toList();
}
