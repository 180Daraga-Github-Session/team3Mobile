import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team3/cubit/cubit.dart';
import 'package:team3/cubit/states.dart';
import 'package:team3/screens/addMessage.dart';
import 'package:team3/widgets/messageUI.dart';

import '../network/api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black12,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddMessage()));
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: Colors.black12,
            elevation: 0,
            title: const Text("Notes"),
            centerTitle: true,
          ),
          body: FutureBuilder<List<Data>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: length,
                      itemBuilder: (context, i) {
                        return message(
                            snapshot.data![i].title,
                            snapshot.data![i].body,
                            snapshot.data![i].date,
                            context);
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        );
      },
    );
  }
}

class Data {
  final String title, body, date;

  Data(this.title, this.body, this.date);
}
