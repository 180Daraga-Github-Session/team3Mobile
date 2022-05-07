import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team3/cubit/states.dart';

import '../network/api.dart';
import '../widgets/textField.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  void add(context) async {
    await postData(titleyControle.text, bodyControle.text);
    await getData();
    Navigator.pop(context);
    emit(addNote());
  }
}
