import 'package:flutter/material.dart';
import 'package:team3/cubit/cubit.dart';

import '../network/api.dart';
import '../widgets/textField.dart';

class AddMessage extends StatelessWidget {
  const AddMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("Add Note"),
      ),
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            buildTextField1(titleyControle, context),
            buildTextField2(bodyControle, context),
            ElevatedButton(
                onPressed: () {
                  AppCubit.get(context).add(context);
                },
                child: const Text("Add"))
          ],
        )),
      ),
    );
  }
}
