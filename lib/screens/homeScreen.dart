import 'package:flutter/material.dart';
import 'package:team3/screens/addMessage.dart';
import 'package:team3/widgets/messageUI.dart';

import '../network/api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddMessage()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: const Text("Notes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => message(notes[index]["title"].toString(),
              notes[index]["body"].toString(), notes[index]["date"].toString(), context),
          itemCount: notes.length,
        ),
      ),
    );
  }
}
