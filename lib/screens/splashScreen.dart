import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:team3/core/utils/navigation.dart';
import 'package:team3/screens/homeScreen.dart';
import 'package:team3/screens/loginScreen.dart';
import '../core/utils/sizeConfig.dart';
import '../network/sp-helper/cache_helper.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_6ubhbq5u.json')));
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    var token = SharedPreferencesHelper.getData(key: 'token');
    /*if (token == null)*/
    AppNavigator.customNavigator(
        context: context, screen: LoginScreen(), finish: true);
    /*else
    AppNavigator.customNavigator(
        context: context, screen: const HomePage(), finish: true);*/
  }
}
