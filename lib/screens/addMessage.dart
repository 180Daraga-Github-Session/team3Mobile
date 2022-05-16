import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team3/bloc/Note%20cubit/cubit/note_cubit.dart';
import 'package:team3/core/utils/navigation.dart';
import 'package:team3/screens/homeScreen.dart';
import '../widgets/textField.dart';

class AddMessage extends StatelessWidget {
  const AddMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteCubit? noteCubit = NoteCubit.get(context);
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
            BlocConsumer<NoteCubit, NoteState>(
              listener: (context, state) {},
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      noteCubit.addNote(
                          title: titleyControle.value.text,
                          body: bodyControle.value.text);
                      AppNavigator.customNavigator(
                          context: context, screen: HomePage(), finish: false);
                    },
                    child: const Text("Add"));
              },
            )
          ],
        )),
      ),
    );
  }
}
