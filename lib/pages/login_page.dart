import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              const Text(
                "welcome",
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
                        hintText: "enter username",
                        labelText: "username",
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "enter password",
                        labelText: "password",
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: (() {
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                }),
                child: Text("login"),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 40), primary: Colors.blueGrey),
              )
            ],
          ),
        ));
  }
}
