import 'package:flutter/material.dart';

InputDecoration inputDecoration() => InputDecoration(
      errorMaxLines: 2,
      errorStyle: TextStyle(
        color: Color.fromARGB(255, 247, 90, 90),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      hintText: "",
      fillColor: Color.fromARGB(255, 0, 0, 0),
      filled: true,
      hintStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
      ),
    );
