import 'package:flutter/material.dart';
import 'package:team3/style/textStyle.dart';

class MessageScreen extends StatelessWidget {
  final String tital;
  final String body;
  final String date;

  const MessageScreen(
      {Key? key, required this.tital, required this.body, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black12,
            elevation: 0,
            title: Text(
              tital,
              style: const TextStyle(fontSize: 25),
            )),
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  body,
                  style: style1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  date,
                  style: style3,
                )
              ],
            ),
          ),
        ));
  }
}
