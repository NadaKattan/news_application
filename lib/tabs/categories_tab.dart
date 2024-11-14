import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab({required this.onCategorySelected, super.key});
  void Function(CategoryModel selectedCategory) onCategorySelected;
  List<CategoryModel> categories=List.generate(6, (index){
    return CategoryModel(id: "$index",imageName: "ball",name: "Sports");
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20, start: 20, end: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category of interest",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppTheme.grey, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, index) => InkWell(onTap:()=>onCategorySelected(categories[index]),child: CategoryItem(categoryModel: categories[index], index: index)),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
