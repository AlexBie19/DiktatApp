import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import '../diktatPage/schoolpages/arbeit_page.dart';
import '../diktatPage/schoolpages/fachoberschule_page.dart';
import '../diktatPage/schoolpages/grunschule_page.dart';
import '../diktatPage/schoolpages/realschule_page.dart';


class DiktatPage extends StatefulWidget {
  const DiktatPage({super.key});

  @override
  State<DiktatPage> createState() => _DiktatPageState();
}

class _DiktatPageState extends State<DiktatPage> {
  Widget buttonsSchools(String schoolText) {
    return SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromARGB(255, 215, 249, 255)),
            alignment: Alignment.center,
            fixedSize: const MaterialStatePropertyAll(Size.fromWidth(30)),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
            elevation: const MaterialStatePropertyAll(5.0),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          child: Text(schoolText,
              style: const TextStyle(
                color: Color.fromARGB(255, 14, 28, 54),
                fontSize: 22,
              )),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkingPage(),
                ),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 215, 249, 255),
          Color.fromARGB(255, 175, 203, 255),
        ],
        stops: [0.3, 0.8],
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          buttonsSchools("Grunschule"),
          const SizedBox(
            height: 24,
          ),
          buttonsSchools("Realschule"),
          const SizedBox(
            height: 24,
          ),
          buttonsSchools("Fachoberschule"),
          const SizedBox(
            height: 24,
          ),
          buttonsSchools("Arbeit")
        ],
      ),
    );
  }
}
