import 'package:cuties_dialer/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cutie's Dialer",
        theme: ThemeData(
            fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
            primarySwatch: Colors.indigo),
        home: const SignUp());
  }
}
