import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  int day = 2;
  String code = "flutter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OUTSTA"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to day $day of code on $code"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
