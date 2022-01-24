import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_and_provider_integration/provider/AuthModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login/flutter_login.dart';


Future<dynamic> Alert(BuildContext context, String content) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Note: ',
            style: TextStyle(color: Colors.red),
          ),
          content: SingleChildScrollView(
            child: Container(
              child: ListBody(
                children: [
                  // Text(content),
                  Text(
                    content,
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),

            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: const Text('ok'),
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      });
}

class LoginPage extends StatelessWidget{
  const LoginPage({Key? key}) : super(key: key);


  Duration get loginTime => const Duration(milliseconds: 1000);

  Future<String?> _authUser(BuildContext context, LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        final controller = context.read<AuthModel>();
        controller.signIn(data.name, data.password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // print('No user found for that email.');
          return 'No user found for that email.';
          // Alert(context, 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          return 'Wrong password provided for that user.';
          // Alert(context, 'Wrong password provided for that user.');
        }
      }
    });
  }

  Future<String?> _signupUser(BuildContext context, SignupData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        // UserCredential userCredential = await FirebaseAuth.instance
        //     .createUserWithEmailAndPassword(
        //         email: data.name!, password: data.password!);
        final controller = context.read<AuthModel>();
        controller.signUp(data.name!, data.password!);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          return 'The account already exists for that email.';
        }
      } catch (e) {
        print(e);
      }
    });
  }

  Future<String?> _recoverPassword(BuildContext context, String name) {
    return Future.delayed(loginTime).then((_) async {
      // if (!users.containsKey(name)) {
      //   return 'User not exists';
      // }
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: name);
        Alert(context, 'Password reset email sent.');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Alert(context, 'No user found for that email');
        } else if (e.code == 'invalid-email') {
          Alert(context, 'Email address is not valid');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
        primaryColor: Colors.teal,
      ),
      title: 'Login/Sign up',
      // logo: const Icon(Icons.account_box_outlined),
      onLogin: (LoginData data) {
        return _authUser(context, data);
      },
      onSignup: (SignupData data) {
        return _signupUser(context, data);
      },
      onSubmitAnimationCompleted: () async {
        User? _user = FirebaseAuth.instance.currentUser;
        if (_user != null && !_user.emailVerified) {
          await _user.sendEmailVerification();
          Alert(context, 'Please Verify Email Address');
        }else{
          Navigator.pop(context);
        }
        // Navigator.pop(context);
      },
      onRecoverPassword: (String name) {
        return _recoverPassword(context, name);
      },
    );
  }
}
