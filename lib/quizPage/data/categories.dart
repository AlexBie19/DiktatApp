import 'package:diktat_flutter_app/appConstants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/questions.dart';
import '../models/category.dart';

final categories = <Category>[
  Category(
    questions: questions,
    categoryName: 'Physics',
    //imageUrl: 'assets/physics.png',
    backgroundColor: Colors.blue,
    icon: Icons.rocket_outlined,
    description: 'Practice questions from various chapters in physics',
  ),
  Category(
    questions: questions,
    //imageUrl: 'assets/chemistry.png',
    categoryName: 'Chemistry',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
    description: 'Practice questions from various chapters in chemistry',
  ),
  Category(
    questions: questions,
    //imageUrl: 'assets/maths.png',
    categoryName: 'Maths',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootVariable,
    description: 'Practice questions from various chapters in maths',
  ),
  Category(
    questions: questions,
    //imageUrl: 'assets/biology.png',
    categoryName: 'Biology',
    backgroundColor: Colors.lightBlue,
    icon: FontAwesomeIcons.dna,
    description: 'Practice questions from various chapters in biology',
  ),
];


final categoriesHomePage = <Category> [
  Category(
    categoryName: 'Ranking',
    questions: questions,
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.trophy
  ),
  Category(
    categoryName: 'Profile',
    questions: questions,
    backgroundColor: const Color.fromARGB(255, 142, 125, 219),
    icon: Icons.person_rounded,
  ),
  Category(
    categoryName: 'Quiz',
    questions: questions,
    backgroundColor: const Color.fromARGB(255, 67, 150, 71),
    icon: Icons.person_rounded,
  ),
  Category(
    categoryName: 'Dictation',
    questions: questions,
    backgroundColor: Colors.red.shade700,
    icon: AppIcons.pen_nib,
  ),
];