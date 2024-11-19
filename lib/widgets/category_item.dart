import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({required this.categoryModel, required this.index, super.key});
  CategoryModel categoryModel;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.red,
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
          Image.asset("assets/images/ball.png"),
          Text(
            "Sports",
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
