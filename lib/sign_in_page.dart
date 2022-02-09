import 'package:flutter/material.dart';
import 'package:google_signin_poc/google_sign_in_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String authCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100,),
            const SizedBox(height: 40),
            GoogleSignInButton(
              onSignIn: (authCode) {
                setState(() {
                  this.authCode = authCode;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              authCode.isEmpty ? 'No Code' : 'Your auth Code: $authCode',
              style: const TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
