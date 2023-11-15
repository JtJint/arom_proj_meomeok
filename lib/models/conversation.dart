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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 530,
          color: Colors.grey,
          child: Text('${conver_list}'),
        ),
        SizedBox(
          height: 30,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
            onTap: () => print('dd'),
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
