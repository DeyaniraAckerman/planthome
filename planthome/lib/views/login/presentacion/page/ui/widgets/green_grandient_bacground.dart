import 'package:flutter/material.dart';

class GreenGradientBackground extends StatelessWidget {
  const GreenGradientBackground({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 24.0, right: 24),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Colors.green,
            Colors.white,
          ])),
      child: child,
    );
  }
}
