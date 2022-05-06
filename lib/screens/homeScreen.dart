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
        child: Column(children: [
          message("title", ";jfskldjfskdjfs;lkdf", "date", context),
          message(
              "First Note",
              "A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs.",
              "date",
              context),
          message("title", "lskdjfsdkfjskfjslk;jfskldjfskdjfs;lkdf", "date",
              context),
          message("title", "lskdjfsdkfjskfjslk;jfskldjfskdjfs;lkdf", "date",
              context),
          message("title", "lskdjfsdkfjskfjslk;jfskldjfskdjfs;lkdf", "date",
              context),
        ]),
      ),
    );
  }
}
