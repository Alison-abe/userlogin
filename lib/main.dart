import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:userlogin/login.dart';
import 'package:firebase_core/firebase_core.dart';


main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
// Ideal time to initialize
runApp(const MyApp());
//...
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.orange,
      ),
      home:  Login(),
    );
  }
}

