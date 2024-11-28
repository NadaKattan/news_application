import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/features/category/data/models/category_model.dart';
import 'package:news_application/features/category/presentation/view/widgets/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab(
      {required this.categories, required this.onCategorySelected, super.key});
  void Function(CategoryModel selectedCategory) onCategorySelected;
  // List<CategoryModel> categories = List.generate(6, (index) {
  //   return CategoryModel(id: "$index", imageName: "ball", name: "Sports");
  // });
  List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10, start: 20, end: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.pick,
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
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
              itemBuilder: (context, index) => InkWell(
                  onTap: () => onCategorySelected(categories[index]),
                  child: CategoryItem(
                      categoryModel: categories[index], index: index)),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
