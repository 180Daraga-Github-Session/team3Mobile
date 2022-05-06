import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team3/cubit/cubit.dart';
import 'package:team3/cubit/states.dart';

import 'screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                home: HomePage());
          },
        ));
  }
}
