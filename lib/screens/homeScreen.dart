import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team3/screens/addMessage.dart';
import 'package:team3/screens/loginScreen.dart';
import 'package:team3/style/textStyle.dart';
import 'package:team3/widgets/messageUI.dart';
import '../bloc/Note cubit/cubit.dart';
import '../bloc/Note cubit/states.dart';
import '../bloc/user cubit/cubit/user_cubit.dart';
import '../core/utils/navigation.dart';
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
            actions: [
              IconButton(
                  onPressed: () {
                    UserCubit.get(context).logout();
                    AppNavigator.customNavigator(
                        context: context, screen: LoginScreen(), finish: false);
                  },
                  icon: Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                    size: 26,
                  ))
            ],
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
