import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? username;
  String? email;
  String? password;

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: key,
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
              validator: ValidationBuilder().maxLength(50).build(),
              onChanged: (value) {
                username = value;
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
              validator: ValidationBuilder().email().maxLength(50).build(),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
              validator: ValidationBuilder().maxLength(20).minLength(6).build(),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  if (key.currentState?.validate() ?? false) {
                    print(email);

                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                  }
                },
                child: const Text(
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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<void> signInWithGoogle() async {
//     try {
//       // Trigger the Google Authentication flow
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) {
//         // If the user cancels the sign-in, return without doing anything
//         return;
//       }

//       // Obtain the authentication details from the Google sign-in
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       // Create a new credential for Firebase
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Use the credential to sign in to Firebase
//       await _auth.signInWithCredential(credential);

//       // You can access the current user details if needed
//       final User? user = _auth.currentUser;
//       print("User signed in: ${user?.displayName}, ${user?.email}");

//       // Show a success message or navigate to another screen
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Sign-in successful!')),
//       );
//     } catch (e) {
//       print("Error signing in with Google: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Sign-in failed! Please try again.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sign Up with Google"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: signInWithGoogle,
//               child: const Text("Sign Up with Google"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
