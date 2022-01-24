import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  final Widget small;
  final Widget medium;
  final Widget large;

  const ScreenSize(
    this.small,
    this.medium,
    this.large,
  );

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < 640;

  static bool isMedium(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 640;

  static bool isLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1000) {
      return large;
    }

    else if (_size.width >= 640) {
      return medium;
    }
    else {
      return small;
    }
  }
}
