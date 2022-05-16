import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/Note cubit/cubit/note_cubit.dart';
import '../bloc/user cubit/cubit/user_cubit.dart';
import '../screens/splashScreen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NoteCubit(),
          ),
          BlocProvider(
            create: (context) => UserCubit(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Note App',
          theme: ThemeData(primarySwatch: Colors.green),
          home: SplachScreen(),
        ));
  }
}
