import 'package:diktat_flutter_app/login_page.dart';
import 'package:flutter/material.dart';
import 'app_icons.dart';
import 'app_colors.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const RootPage()
      },
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
    Text(
      'Quiz',
      style: optionStyle,
    ),
    Text(
      'Diktat',
      style: optionStyle,
    ),
    Text(
      'Analytics',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ivory,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      appBar: AppBar(),
      // Child is always needed, when you want to add something inside the widget
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ivory,
        currentIndex: _selectedIndex,
        unselectedItemColor: oxfordBlue,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          // A list in Flutter need more then one Item inside it otherwise we will get an error
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.pen_nib, size: 19
            ),
            label: "Diktat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: "Analytics",
          ),
        ],
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
