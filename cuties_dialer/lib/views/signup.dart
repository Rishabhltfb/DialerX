import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Form(
        key: key,
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Sign Up",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
