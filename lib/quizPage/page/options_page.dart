import 'package:flutter/material.dart';
import '../data/utils.dart';
import '../models/option.dart';
import '../models/question.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  final ValueChanged<Option> onClickedOption;
  final Question question;

  Widget backgroundcolor() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 215, 249, 255),
            Color.fromARGB(255, 175, 203, 255),
          ],
          stops: [0.3, 0.8],
        ),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);

    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            backgroundcolor(),
            buildAnswer(option),
            buildSolution(question.selectedOption, option),
          ],
        ),
      ),
    );
  }

  Widget buildAnswer(Option option) => SizedBox(
        height: 50,
        child: Row(children: [
          Text(
            option.code,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(width: 12),
          Text(
            option.text,
            style: const TextStyle(fontSize: 20),
          )
        ]),
      );

  Widget buildSolution(Option solution, Option answer) {
    if (solution == answer) {
      return Text(
        question.solution,
        style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      );
    } else {
      return Container();
    }
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      return option.isCorrect ? Colors.green : Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) => ListView(
        //physics: const BouncingScrollPhysics(),
        children: Utils.heightBetween(
          question.options
              .map((option) => buildOption(context, option))
              .toList(),
          height: 8,
        ),
      );
}
