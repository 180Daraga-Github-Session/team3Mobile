import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:team3/bloc/Note%20cubit/cubit.dart';
import 'package:team3/bloc/user%20cubit/cubit/user_cubit.dart';
import 'package:team3/core/utils/sizeConfig.dart';
import 'package:team3/screens/homeScreen.dart';

import '../core/utils/navigation.dart';
import '../widgets/textField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? emailControle = TextEditingController();
    TextEditingController? passwordControle = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Lottie.asset("assets/lottie/data(1).json"),
                      ),
// need to be reviewed
                      buildTextField3(emailControle, context, 'Email'),
                      buildTextField3(passwordControle, context, 'Password'),
                      ElevatedButton(
                          onPressed: () {
                            UserCubit.get(context).login(
                                emailControle.text, passwordControle.text);
                            AppNavigator.customNavigator(
                                context: context,
                                screen: HomePage(),
                                finish: false);
                          },
                          child: const Text("Login"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
