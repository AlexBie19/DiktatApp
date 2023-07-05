import 'package:diktat_flutter_app/analyticsPage/analytics_page.dart';
import 'package:diktat_flutter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../homePage/ranking_page.dart';

class FakePage extends StatefulWidget {
  const FakePage({super.key});

  @override
  State<FakePage> createState() => _FakePageState();
}

class _FakePageState extends State<FakePage> {
  String text =
      "Familie Müller plant ihren Urlaub. Sie geht in ein Reisebüro und lässt sich von einem Angestellten beraten. Als Reiseziel wählt sie Mallorca aus. Familie Müller bucht einen Flug auf die Mittelmeerinsel. Sie bucht außerdem zwei Zimmer in einem großen Hotel direkt am Strand. Familie Müller badet gerne im Meer.";

  static const kHintTextStyle = TextStyle(
    color: Color.fromARGB(255, 249, 251, 242),
  );

  final kBoxDecorationStyle = BoxDecoration(
    color: const Color.fromARGB(255, 14, 28, 54),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 14, 28, 54),
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  Widget eingabeFeld() {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: SizedBox(
          height: 200,
          width: 350,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Color.fromARGB(255, 249, 251, 242),
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter the Text above',
              hintStyle: kHintTextStyle,
            ),
          ),
        ));
  }

  Widget buttonsSchools(String schoolText) {
    return SizedBox(
        height: 60,
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
          onPressed: _showcontent,
          child: Text(schoolText,
              style: const TextStyle(
                color: Color.fromARGB(255, 14, 28, 54),
                fontSize: 22,
              )),
        ));
  }

  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Vorsicht'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Sind sie sicher, dass sie fertig sind'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Weiter'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RootPage(email: 'Admin',),),);
              },
            ),
          ],
        );
      },
    );
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RankingPage(),
                ),
              );
            },
            icon: const Icon(FontAwesomeIcons.trophy)),
        title: const Text("Admin"),
        actions: const [
          Text(
            " 1110",
            style: TextStyle(
              letterSpacing: 2,
              height: 2,
              fontSize: 25,
              color: Color.fromARGB(255, 14, 28, 54),
            ),
          ),
        ],
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
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Center(
            child: Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: "Text zum Abschreiben",
                  style: TextStyle(
                    fontSize: 26,
                    color: Color.fromARGB(255, 14, 28, 54),
                  ),
                ),
                WidgetSpan(
                  child: Icon(Icons.mic, size: 30),
                ),
              ],
            )),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: text,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 14, 28, 54),
                  ),
                ),
              ],
            )),
          ),
          const SizedBox(height: 20),
          eingabeFeld(),
          const SizedBox(height: 100,),
          buttonsSchools("Fertig")
        ],
      ),
    );
  }
}
