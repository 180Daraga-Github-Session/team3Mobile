import 'package:flutter/material.dart';

import '../network/api.dart';
import '../widgets/textField.dart';

class AddMessage extends StatelessWidget {
  const AddMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("Add Note"),
      ),
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            buildTextField1(titleyControle, context),
            buildTextField2(bodyControle, context),
            ElevatedButton(
                onPressed: () async {
                  await getHttp();
                  Navigator.pop(context);
                },
                child: Text("Add"))
          ],
        )),
      ),
    );
  }
}
