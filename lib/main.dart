import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Statless widget can not refresh while using the app
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 14, 25, 54)),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  // Stateful widgets can refresh the App while using it
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  // Color Palette
  Color linen = const Color.fromARGB(255, 255, 237, 225); //
  Color ivory = const Color.fromARGB(255, 249, 251, 242); // Background
  Color lightCyan = const Color.fromARGB(255, 215, 249, 255); // Teritary
  Color jordyBlue = const Color.fromARGB(255, 175, 203, 255); // Secondary
  Color oxfordBlue = const Color.fromARGB(255, 14, 28, 54); // PrimaryColor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: linen,
      appBar: HomeBar(),
      // Child is always needed, when you want to add something inside the widget
      bottomNavigationBar: NavigationBar(
        backgroundColor: ivory,
        shadowColor: jordyBlue,
        destinations: const [
          // A list in Flutter need more then one Item inside it otherwise we will get an error
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
          NavigationDestination(
            icon: Icon(Icons.question_mark_rounded),
            label: "Quiz",
          ),
          NavigationDestination(
            icon: Icon(Icons.brush_rounded),
            label: "Diktat",
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            label: "Analytics",
          ),
        ],
        onDestinationSelected: (int index) {
          // Sets the current page index
          setState(
            () {
              currentPage = index;
            },
          );
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

class HomeBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  HomeBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Flutter',
      ),
      automaticallyImplyLeading: true,
    );
  }
}
