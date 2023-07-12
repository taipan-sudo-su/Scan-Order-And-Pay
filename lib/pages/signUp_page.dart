import 'package:cafeteria_app/pages/home_page.dart';
import 'package:cafeteria_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/authFunctions.dart';

class signupPage extends StatefulWidget {
  const signupPage({Key? key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String username = '';

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
                const SizedBox(height: 25),
                const Text(
                  "SignUp",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.verified_user),
                          hintText: "enter username",
                          labelText: "username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username cannot be empty";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            username = value!;
                          });
                        },
                      ),
                      TextFormField(
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
                      TextFormField(
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
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AuthServices.signup(email, password, username, context);
                      Get.to(() => const loginPage());
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
                      child: Text("Signup",
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
                    Get.to(() => const loginPage());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Text("Already have an account",
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
