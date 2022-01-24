import 'package:flutter/material.dart';
import 'package:flutter_firebase_and_provider_integration/provider/AuthModel.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class Greeting extends StatelessWidget {
  Greeting(this.suffix, {Key? key}) : super(key: key);

  String suffix;

  var pattern = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    var stylish = Theme.of(context).textTheme.headline4?.copyWith(
          color: secondaryColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        );

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      height: 100,
      width: double.infinity,
      child: Consumer<AuthModel>(builder: (context, auth, child) {
        return auth.isSignIn
            ? Center(
                child: Text(
                  "${pattern.stringMatch(auth.user!.email!)}".split('@').first + "," + " $suffix",
                  style: stylish,
                ),
              )
            : Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Please Sign In',
                      style: stylish,
                    ))
              );
      }),
    );
  }
}
