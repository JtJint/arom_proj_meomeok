import 'package:admob_flutter/admob_flutter.dart';
import 'package:arom_proj_meomeok/Screens/rand.dart';

import 'package:flutter/material.dart';

List<String> filter_id = [];

class mainScreen extends StatelessWidget {
  mainScreen({super.key});

  @override
  // final _black = Colors.black;
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/아롬.png'),
              const SizedBox(
                width: 13,
              ),
              Container(
                width: 260,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: SearchBar(
                  trailing: [
                    Image.asset(
                      'assets/돋보기.png',
                      color: Colors.grey,
                    ),
                  ],
                  hintText: "오늘은 머먹지..?",
                  hintStyle: const MaterialStatePropertyAll(
                      TextStyle(color: Colors.grey)),
                  textStyle: const MaterialStatePropertyAll(
                      TextStyle(color: Colors.black, fontSize: 13)),
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  shadowColor: const MaterialStatePropertyAll(Colors.white),
                  elevation: const MaterialStatePropertyAll(0),
                  overlayColor:
                      MaterialStatePropertyAll(Colors.blueAccent.shade200),
                  shape: MaterialStatePropertyAll(
                    ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              IconButton(
                onPressed: () {
                  print('Tap!');
                },
                icon: Image.asset('assets/설정창.png'),
                iconSize: 10,
              ),
            ],
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              width: 430,
              height: 300,
              child: AdmobBanner(
                adUnitId: 'ca-app-pub-7851651361129540/8261766226',
                adSize: AdmobBannerSize(width: 430, height: 300),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // - - - 이거 만들어야함. 공부좀 해보고 생각해보고 만들어보자잇!
        const SizedBox(
          height: 30,
        ),
        Container(
          // padding: EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey.shade300)],
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.white)],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        line_one(
                          Image.asset('assets/한식.png'),
                          Image.asset('assets/중식.png'),
                          Image.asset('assets/일식.png'),
                          Image.asset('assets/양식.png'),
                          true,
                          '한식',
                          '중식',
                          '일식',
                          '양식',
                          '46',
                          '47',
                          '48',
                          '49',
                        ) // 한 라인 이미지 만드는 메소드 하나로 만들수 있기는 한데 귀찮음. 걍 이렇게 만듦.,
                        ,
                        line_one(
                          Image.asset('assets/밥.png'),
                          Image.asset('assets/빵.png'),
                          Image.asset('assets/면.png'),
                          Image.asset('assets/고기.png'),
                          false,
                          '밥',
                          '빵',
                          '면',
                          '고기',
                          '51',
                          '52',
                          '53',
                          '54',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),

        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: TextButton(
            style: const ButtonStyle(
                side: MaterialStatePropertyAll(
                    BorderSide(style: BorderStyle.solid)),
                foregroundColor: MaterialStatePropertyAll(Colors.white30)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => randScreen(
                      FilterId: filter_id,
                    ),
                  ));
            },
            child: const Text(
              '랜덤 돌리기',
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ]),
    ));
  }

  Row line_one(
    Image image1,
    Image image2,
    Image image3,
    Image image4,
    bool top,
    String Text1,
    String Text2,
    String Text3,
    String Text4,
    String Sid1,
    String Sid2,
    String Sid3,
    String Sid4,
  ) {
    return Row(
      children: [
        Column(
          children: [
            main_icons(
                image1: image1,
                number: 1,
                top: top,
                select: true,
                Filters: filter_id,
                id_S: Sid1),
            Text(
              '$Text1',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            main_icons(
              image1: image2,
              number: 2,
              top: top,
              select: true,
              Filters: filter_id,
              id_S: Sid2,
            ),
            Text(
              '$Text2',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            main_icons(
                image1: image3,
                number: 3,
                top: top,
                select: true,
                Filters: filter_id,
                id_S: Sid3),
            Text(
              '$Text3',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            main_icons(
                image1: image4,
                number: 4,
                top: top,
                select: true,
                Filters: filter_id,
                id_S: Sid4),
            Text(
              '$Text4',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class main_icons extends StatefulWidget {
  main_icons({
    super.key,
    required this.image1,
    required this.number,
    required this.top,
    required this.select,
    required this.Filters,
    required this.id_S,
  });
  final Image image1;
  var number;
  var top;
  bool select;
  List<String> Filters;
  String id_S;
  // Function a;

  @override
  State<main_icons> createState() => _main_iconsState();
}

class _main_iconsState extends State<main_icons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(
        () {
          widget.select = !widget.select;
          if (widget.select == false) {
            if (!widget.Filters.contains(widget.id_S)) {
              widget.Filters.add(widget.id_S);
            }
            print(widget.Filters);
            filteridSET(widget.Filters);
          } else {
            if (widget.Filters.contains(widget.id_S)) {
              widget.Filters.remove(widget.id_S);
              filteridSET(widget.Filters);
              print(widget.Filters);
            }
          }
        },
      ),
      child: Container(
        decoration: BoxDecoration(
            color: widget.select ? Colors.white : Colors.grey.shade200,
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
            border: Border.all(color: Colors.white)),
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            Container(
              width: 90,
              child: widget.image1,
            ),
          ],
        ),
      ),
    );
  }
}

void filteridSET(List<String> Filters) {
  filter_id = Filters;
  print(filter_id);
}
