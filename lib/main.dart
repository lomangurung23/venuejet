import 'package:firebase_core/firebase_core.dart'; // Import the FirebaseFirestore package to interact with Firebase Cloud Firestore
import 'package:flutter/material.dart';
import 'package:venuejet/login_page.dart';// import login page


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venue Jet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
    );
  }
}
