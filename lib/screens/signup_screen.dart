import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:team3/bloc/user%20cubit/cubit/user_cubit.dart';

import '../style/textStyle.dart';
import '../widgets/formInputField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';
    UserCubit? userCubit = UserCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Lottie.asset("assets/lottie/signup.json"),
                  Text(
                    'First Name',
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
                          return 'First name is required';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    'Last Name',
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
                          return 'last name is required';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                  ),
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
                      onSaved: (value) {
                        setState(() {
                          email = value;
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
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  BlocConsumer<UserCubit, UsercubitState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(290, 40),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                userCubit.signup(
                                    email: email,
                                    password: password,
                                    firstName: firstName,
                                    lastName: lastName);
                              }
                            },
                            child: const Text('Sign UP'),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
