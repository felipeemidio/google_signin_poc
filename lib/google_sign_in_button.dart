import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  final void Function(String) onSignIn;

  const GoogleSignInButton({Key? key, required this.onSignIn}) : super(key: key);

  _handleSignIn() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
        // clientId: '875613427205-abhl6u7ph7g6231njv5llqs33pp2p0oh.apps.googleusercontent.com',
      );
      final account = await _googleSignIn.signIn();
      if(account == null) {
        return null;
      }
      log('Logged as ${account.displayName}');
      onSignIn(account.serverAuthCode ?? '');

    } on PlatformException catch (error, st) {
      log(error.code);
      log(error.message ?? 'No message');
      log(st.toString());
    } catch (error, st) {
      log(error.toString());
      log(st.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _handleSignIn,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shadowColor: Colors.black,
        ),
        child: Row(
          children: [
            SizedBox(height: 28, width: 28, child: Image.asset('assets/images/google_logo.png')),
            Expanded(child: Container(),),
            const Center(
              child: Text(
                "CONTINUE WITH GOOGLE",
                style: TextStyle(letterSpacing: 1, color: Colors.black),
              ),
            ),
            const SizedBox(width: 28,),
            Expanded(child: Container(),),
          ],
        ),
      ),
    );
  }
}