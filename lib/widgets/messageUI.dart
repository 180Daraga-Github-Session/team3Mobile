import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team3/style/textStyle.dart';

import '../screens/messageScreen.dart';

Widget message(String title, String body, String date, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MessageScreen(
                    body: body,
                    date: date,
                    tital: title,
                  )));
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 109, 109, 109),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
              child: Text(
            title,
            style: style1,
          )),
          const SizedBox(
            height: 5,
          ),
          Text(
            body,
            style: style2,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: style3,
          )
        ]),
      ),
    ),
  );
}
