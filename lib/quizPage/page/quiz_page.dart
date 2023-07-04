import 'package:flutter/material.dart';
import '../../profilePage/user_data.dart';
import '../data/categories.dart';
import '../page/category_page.dart';
import '../widget/category_detail_widget.dart';
import '../widget/category_header_widget.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  static const user = UserPreferences.myUser;

  Widget buildCategories() => SizedBox(
        height: 300,
        child: GridView(
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: categories
              .map((category) => CategoryHeaderWidget(category: category))
              .toList(),
        ),
      );

  Widget buildPopular(BuildContext context) => Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Popular',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: ListView(
              //physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: categories
                  .map(
                    (category) => CategoryDetailWidget(
                      category: category,
                      onSelectedCategory: (category) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => // Need to say here which page you wan to jump
                                CategoryPage(category: category),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) => ScaffoldGradientBackground(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 215, 249, 255),
            Color.fromARGB(255, 175, 203, 255),
          ],
          stops: [0.3, 0.8],
        ),
        body: ListView(
          //physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            buildCategories(),
            const SizedBox(height: 32),
            buildPopular(context),
          ],
        ),
      );
}
