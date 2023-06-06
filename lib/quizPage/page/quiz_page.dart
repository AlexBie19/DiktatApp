import 'package:flutter/material.dart';
import '../../profilePage/user_data.dart';
import '../data/categories.dart';
import '../page/category_page.dart';
import '../widget/category_detail_widget.dart';
import '../widget/category_header_widget.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  static const user = UserPreferences.myUser;

  Widget buildWelcome(String username) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            username,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      );

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
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: categories
                  .map(
                    (category) => CategoryDetailWidget(
                      category: category,
                      onSelectedCategory: (category) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
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

  Widget backgroundcolor() {
    return Container(
      height: double.infinity,
      width: double.infinity,
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
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            Container(
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
            ),
            const SizedBox(height: 8),
            buildCategories(),
            const SizedBox(height: 32),
            buildPopular(context),
          ],
        ),
      );
}
