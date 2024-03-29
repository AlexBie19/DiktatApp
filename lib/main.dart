import 'package:diktat_flutter_app/homePage/home_page.dart';
import 'package:diktat_flutter_app/loginPage/login_new.dart';
// ignore: unused_import
import 'package:diktat_flutter_app/loginPage/login_page.dart';
import 'package:diktat_flutter_app/profilePage/profile_page.dart';
import 'package:diktat_flutter_app/quizPage/page/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'analyticsPage/analytics_page.dart';
import 'appConstants/app_icons.dart';
import 'appConstants/app_colors.dart';
import 'diktatPage/diktat_page.dart';
import 'homePage/ranking_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Statless widget can not refresh while using the app
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 14, 25, 54)),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
      },
    );
  }
}

class RootPage extends StatefulWidget {
  // Stateful widgets can refresh the App while using it
  const RootPage({super.key, required this.email});

  final String email;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions = <Widget>[
    HomePage(email: widget.email),
    const ProfilePage(),
    const QuizPage(),
    const DiktatPage(),
    const AnalyticsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 215, 249, 255),
          Color.fromARGB(255, 175, 203, 255),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.3, 0.8],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        title: Text(widget.email),
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
      // Child is always needed, when you want to add something inside the widget
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(AppIcons.pen_nib, size: 19),
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
