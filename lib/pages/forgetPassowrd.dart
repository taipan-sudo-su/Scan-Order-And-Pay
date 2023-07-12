import 'package:cafeteria_app/pages/home_page.dart';
import 'package:cafeteria_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPasswordPage extends StatefulWidget {
  const forgetPasswordPage({super.key});

  @override
  State<forgetPasswordPage> createState() => _signupPageState();
}

class _signupPageState extends State<forgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              // image.asset
              const SizedBox(height: 25),
              Text(
                "Forget Password",
                style: const TextStyle(
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
                        hintText: "enter email",
                        labelText: "email",
                      ),
                      onChanged: (value) {
                        setState(() {
                          build(context);
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
                onTap: () {
                  Get.to(() => homepage());
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 113, 103),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Send verification",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
            ],
          ),
        ));
  }
}
