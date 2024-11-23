import 'package:flutter/material.dart';
import 'package:news_application/features/category/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({required this.categoryModel, required this.index, super.key});
  CategoryModel categoryModel;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: index % 2 == 0
              ? const Radius.circular(20)
              : const Radius.circular(0),
          bottomRight: index % 2 != 0
              ? const Radius.circular(20)
              : const Radius.circular(0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryModel.imageName),
          Text(
            categoryModel.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
