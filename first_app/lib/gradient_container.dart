import 'package:flutter/material.dart';

const startAligment = Alignment.topCenter;
const endAligment = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAligment,
          end: endAligment,
        ),
      ),
      child: Center(
        child: Image.asset('assets/images/dice-1.png', width: 200),
      ),
    );
  }
}
