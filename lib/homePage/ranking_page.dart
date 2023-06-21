import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        title: const Text("Ranking"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        foregroundColor: const Color.fromARGB(255, 14, 28, 54),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 215, 249, 255),
                Color.fromARGB(255, 175, 203, 255),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.3, 0.8],
            ),
          ),
        ),
      ),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 215, 249, 255),
          Color.fromARGB(255, 175, 203, 255),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.3, 0.8],
      ),
    );
  }
}
