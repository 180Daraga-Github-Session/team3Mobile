import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:team3/bloc/user%20cubit/cubit/user_cubit.dart';
import 'package:team3/core/utils/sizeConfig.dart';
import 'package:team3/screens/homeScreen.dart';
import 'package:team3/screens/signup_screen.dart';

import '../core/utils/navigation.dart';
import '../style/textStyle.dart';
import '../widgets/formInputField.dart';
import '../widgets/textField.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    UserCubit? userCubit = UserCubit.get(context);
    TextEditingController? emailControle = TextEditingController();
    TextEditingController? passwordControle = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(20),
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Lottie.asset("assets/lottie/data(1).json"),
                          ),
// need to be reviewed
                          Text(
                            'Email',
                            style: style2,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              style: style4,
                              decoration: inputDecoration(),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                } else if (!value.contains('@') ||
                                    !value.contains('.')) {
                                  return 'Please enter valid email ex : "example@mail.com"';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                  print(email);
                                });
                              },
                            ),
                          ),
                          Text(
                            'Password',
                            style: style2,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              style: style4,
                              decoration: inputDecoration(),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                } else if (value.length < 8) {
                                  return 'Password should be at least 8 characters';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                          ),
                          Center(
                            child: BlocConsumer<UserCubit, UsercubitState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(310, 40),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        userCubit.login(email!, password!);
                                        if (userCubit.found!) {
                                          AppNavigator.customNavigator(
                                              context: context,
                                              screen: HomePage(),
                                              finish: false);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('User Not Found')),
                                          );
                                        }
                                      } else
                                        print('not valid');
                                    },
                                    child: const Text("Login"));
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?',
                                  style: TextStyle(color: Colors.grey)),
                              TextButton(
                                  onPressed: () {
                                    AppNavigator.customNavigator(
                                        context: context,
                                        screen: SignupScreen(),
                                        finish: true);
                                  },
                                  child: Text(
                                    'Sign Up now ',
                                    style: TextStyle(color: Colors.green),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
