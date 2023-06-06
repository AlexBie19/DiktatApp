import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'question.dart';

class Category {
  Category({
    required this.questions,
    required this.categoryName,
    this.description = '',
    this.backgroundColor = Colors.orange,
    this.icon = FontAwesomeIcons.question,
  });

  final Color backgroundColor;
  final String categoryName;
  final String description;
  final IconData icon;
  final List<Question> questions;
    
}