import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryDetailWidget extends StatelessWidget {
  const CategoryDetailWidget({
    Key? key,
    required this.category,
    required this.onSelectedCategory,
  }) : super(key: key);

  final Category category;
  final ValueChanged<Category> onSelectedCategory;

  Widget buildImage() => Container(
        height: 150,
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
      );

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onSelectedCategory(category),
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImage(),
              const SizedBox(height: 12),
              Text(
                category.categoryName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 14, 28, 54)),
              ),
              const SizedBox(height: 4),
              Text(
                category.description,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 14, 28, 54)),
              )
            ],
          ),
        ),
      );
}
