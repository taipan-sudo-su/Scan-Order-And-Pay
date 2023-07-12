import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cafeteria_app/pages/home_page.dart';
import 'package:cafeteria_app/pages/login_page.dart';
import 'package:cafeteria_app/pages/try.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

import 'package:cafeteria_app/pages/login_page.dart';

import 'models/cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBfeoh9LnS6RyCQt9maxXASQnumnGM4Pvg",
          appId: "1:556628666551:web:073b7f8c1c5a8107dec532",
          messagingSenderId: "556628666551",
          projectId: "cafeteria0app0juit"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),

        // Add other providers here if needed
      ],
      child: GetMaterialApp(
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return loginPage();
              } else {
                return loginPage();
              }
            }),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
      ),
    );
  }
}
