import 'package:cafeteria_app/pages/home_page.dart';
import 'package:cafeteria_app/pages/signUp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/authFunctions.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void moveToHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Get.to(() => homepage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
                const Text(
                  "LogIn",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          // set a fixed height value
                          child: TextFormField(
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.verified_user),
                              hintText: "enter email",
                              labelText: "email",
                            ),
                            validator: (value) {
                              if (!(value.toString().contains('@'))) {
                                return "Invalid Email";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                email = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          // set a fixed height value
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.visibility),
                              hintText: "enter password",
                              labelText: "password",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value.length < 8) {
                                return "short password : length should be atleast 8";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                password = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AuthServices.signin(email, password, context);

                      moveToHome(context);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 113, 103),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("LogIn",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const signupPage());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Text("Don't have an account",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
