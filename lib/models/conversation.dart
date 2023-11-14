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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text_rand_button(
              txt: '결정!',
              function: () => print('결정!'),
            ),
            Text_rand_button(
              txt: '다시!',
              function: () => print('list,add'),
            )
          ],
        )
      ],
    );
  }
}

class Text_rand_button extends StatelessWidget {
  const Text_rand_button({
    required this.txt,
    required this.function,
    super.key,
  });
  final String txt;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 60, blurStyle: BlurStyle.inner)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
              topRight: Radius.circular(23))),
      child: TextButton(
          style: ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(Colors.white)),
          onPressed: () => this.function,
          child: Text(
            '${this.txt}',
            style: TextStyle(fontSize: 20, color: Colors.black),
          )),
    );
  }
}
