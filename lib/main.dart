import 'package:diktat_flutter_app/home_page.dart';
import 'package:diktat_flutter_app/profile_page.dart';
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
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  // Stateful widgets can refresh the while using the app
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Floating Action Button");
        },
        child: const Icon(Icons.add),
      ),
      // Child is always, when you want to add something insider the widget
      bottomNavigationBar: NavigationBar(
        destinations: const [
          // A list in Flutter need more then one Item inside it otherwise we will get an error
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
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
          NavigationDestination(icon: Icon(Icons.), label: label)
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
