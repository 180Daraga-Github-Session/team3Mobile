import 'package:flutter/material.dart';

import '../style/textStyle.dart';

TextEditingController titleyControle = TextEditingController();
TextEditingController bodyControle = TextEditingController();

Widget buildTextField1(TextEditingController inputControle, context) {
  const maxLines = 3;
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Color.fromARGB(255, 109, 109, 109),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.all(12),
    height: maxLines * 24.0,
    child: TextField(
      style: TextStyle(
          color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
      controller: inputControle,
      maxLines: maxLines,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Enter Title",
          fillColor: Color.fromARGB(255, 0, 0, 0),
          filled: true,
          hintStyle: TextStyle(color: Colors.white)),
      onChanged: (value) {},
    ),
  );
}

Widget buildTextField2(TextEditingController inputControle, context) {
  const maxLines = 5;
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Color.fromARGB(255, 109, 109, 109),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.all(12),
    height: maxLines * 24.0,
    child: TextField(
      style: TextStyle(
          color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
      controller: inputControle,
      maxLines: maxLines,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your Note..",
          fillColor: Color.fromARGB(255, 0, 0, 0),
          filled: true,
          hintStyle: TextStyle(color: Colors.white)),
      onChanged: (value) {},
    ),
  );
}

Widget buildTextField3(
    TextEditingController inputControle, context, String label) {
  const maxLines = 1;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 30.0),
        child: Text(
          label,
          style: style2,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 109, 109, 109),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.all(30),
        height: maxLines * 60.0,
        child: TextField(
          style: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
          controller: inputControle,
          maxLines: maxLines,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "",
              fillColor: Color.fromARGB(255, 0, 0, 0),
              filled: true,
              hintStyle: TextStyle(color: Colors.white)),
          onChanged: (value) {},
        ),
      )
    ],
  );
}
