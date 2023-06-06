import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/category.dart';
import '../models/option.dart';
import '../models/question.dart';
import '../widget/question_numbers_widget.dart';
import '../widget/questions_widget.dart';

class CategoryPage extends StatefulWidget {
  final Category category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late PageController controller;
  late Question question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.category.questions.first;
  }

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

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          surfaceTintColor: const Color.fromARGB(255, 14, 28, 54),
          foregroundColor: const Color.fromARGB(255, 14, 28, 54),
          title: Text(widget.category.categoryName),
          actions: const [
            Icon(Icons.filter_alt_outlined),
            SizedBox(width: 16),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 215, 249, 255),
                  Color.fromARGB(255, 175, 203, 255),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: QuestionNumbersWidget(
                questions: widget.category.questions,
                question: question,
                onClickedNumber: (index) =>
                    nextQuestion(index: index, jump: true),
              ),
            ),
          ),
        ),
        body: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                backgroundcolor(),
                QuestionsWidget(
                  category: widget.category,
                  controller: controller,
                  onChangedPage: (index) => nextQuestion(index: index),
                  onClickedOption: selectOption,
                ),
              ],
            ),
          ),
        ),
      );


  void selectOption(Option option) {
    if (question.isLocked) {
      return;
    } else {
      setState(() {
        question.isLocked = true;
        question.selectedOption = option;
      });
    }
  }

  void nextQuestion({int? index, bool jump = false}) {
    final nextPage = controller.page! + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
      question = widget.category.questions[indexPage];
    });

    if (jump) {
      controller.jumpToPage(indexPage);
    }
  }
}
