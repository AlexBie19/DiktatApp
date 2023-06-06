import 'option.dart';

class Question {
  Question({
    required this.text,
    required this.options,
    required this.solution,
    this.isLocked = false,
    required this.selectedOption,
  });

  bool isLocked;
  final List<Option> options;
  Option selectedOption;
  final String solution;
  final String text;
}
