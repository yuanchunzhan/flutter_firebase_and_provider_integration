import 'package:flutter/material.dart';
import 'package:flutter_firebase_and_provider_integration/components/greeting.dart';
import 'package:flutter_firebase_and_provider_integration/screen_size.dart';

import 'components/header.dart';
import 'components/side_menu.dart';

class MainScaffold extends StatelessWidget {
  final ScrollController _indexController = ScrollController();

  MainScaffold({required this.body, required this.greeting, required this.title, Key? key}) : super(key: key);

  final String title;
  final String greeting;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ScreenSize.isLarge(context))
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                controller: _indexController,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Header(title),
                    const SizedBox(height: 16.0),
                    Greeting(greeting),
                    body,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
