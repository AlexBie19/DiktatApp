import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class GrundschulePage extends StatefulWidget {
  const GrundschulePage({super.key});

  @override
  State<GrundschulePage> createState() => _GrundschulePageState();
}

class _GrundschulePageState extends State<GrundschulePage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 215, 249, 255),
          Color.fromARGB(255, 175, 203, 255),
        ],
        stops: [0.3, 0.8],
      ),
    );
  }
}
