import 'package:flutter/material.dart';
import 'package:team3/network/sp-helper/cache_helper.dart';
import 'package:team3/src/app_root.dart';
import 'network/dio-helper/dio_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(const AppRoot());
}

