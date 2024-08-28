import 'package:flutter/material.dart';
import 'package:quicksale_super_admin/views/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  await Firebase.initializeApp(
    options: FirebaseOptions(
          apiKey: "AIzaSyBrbUFNjHn7LHvQ1pUrWAp9teojp-OBhxA",
          authDomain: "rolade-pos.firebaseapp.com",
          projectId: "rolade-pos",
          storageBucket: "rolade-pos.appspot.com",
          messagingSenderId: "169894090592",
          appId: "1:169894090592:web:7ce3c012909467f1437005",
          measurementId: "G-PNNXSRZHXB"
    )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Admin Panel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: Home(),
    );
  }
}
