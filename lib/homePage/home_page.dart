import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import '../quizPage/data/categories.dart';
import '../quizPage/page/category_page.dart';
import '../quizPage/widget/category_detail_widget.dart';
import '../quizPage/widget/category_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.email});

  final String email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          children: categoriesHomePage
              .map((category) => CategoryHeaderWidget(category: category))
              .toList(),
        ),
      );

  Widget buildPopular(BuildContext context) => Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Recently used',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: categoriesHomePage
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
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 24),
            buildCategories(),
            const SizedBox(height: 18),
            const Text(
              "Tipp des Tages",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 14, 28, 54),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Konsonanten werden nach einem kurz gesprochenen Vokal verdoppelt",
              style: TextStyle(fontSize: 21),
            ),
            const SizedBox(
              height: 18,
            ),
            buildPopular(context),
          ],
        ),
      );
}
