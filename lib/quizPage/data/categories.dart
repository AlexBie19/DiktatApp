import 'package:diktat_flutter_app/appConstants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/questions.dart';
import '../models/category.dart';

final categories = <Category>[
  Category(
    questions: questions,
    categoryName: 'Grundschule',
    //imageUrl: 'assets/physics.png',
    backgroundColor: Colors.blue,
    icon: Icons.book,
    description: 'Trainiere Fragen im Fach Grundschul Level',
  ),
  Category(
    questions: questions,
    //imageUrl: 'assets/chemistry.png',
    categoryName: 'Realschule',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
    description: 'Trainiere Fragen auf Realschule Level',
  ),
  Category(
    questions: questions,
    //imageUrl: 'assets/maths.png',
    categoryName: 'FOS',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootVariable,
    description: 'Trainiere Fragen auf Fachhochschul Level',
  ),
  Category(
    questions: questions,
    //imageUrl: 'assets/biology.png',
    categoryName: 'Arbeiter',
    backgroundColor: Colors.lightBlue,
    icon: FontAwesomeIcons.dna,
    description: 'Trainiere Fragen für dein Arbeitsleben',
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