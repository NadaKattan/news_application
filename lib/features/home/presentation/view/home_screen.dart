import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/constants.dart';
import 'package:news_application/features/category/data/models/category_model.dart';
import 'package:news_application/features/category/presentation/view/widgets/categories_tab.dart';
import 'package:news_application/features/category/presentation/view/widgets/category_details.dart';
import 'package:news_application/features/settings/presentation/view/settings_tab.dart';
import 'package:news_application/features/home/presentation/view/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerTabs drawerTab = DrawerTabs.categoriesTab;
  CategoryModel? category;
  List<CategoryModel> categories = [
    CategoryModel(
        id: "sports", imageName: "assets/images/ball.png", name: "Sports"),
    CategoryModel(
        id: "business",
        imageName: "assets/images/bussines.png",
        name: "Business"),
    CategoryModel(
        id: "health", imageName: "assets/images/health.png", name: "Health"),
    CategoryModel(
        id: "technology",
        imageName: "assets/images/Politics.png",
        name: "Technology"),
    CategoryModel(
        id: "science", imageName: "assets/images/science.png", name: "Science"),
    CategoryModel(
        id: "entertainment",
        imageName: "assets/images/environment.png",
        name: "Entertainment"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News App",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        drawer: HomeDrawer(
          onItemSelected: changeTab,
        ),
        body: category != null
            //###########################################################################
            ? CategoryDetails(
                categoryId: category?.id ?? "",
              )
            : drawerTab == DrawerTabs.categoriesTab
                ? CategoriesTab(
                    categories: categories,
                    onCategorySelected: chooseCategory,
                  )
                : const SettingsTab(),
      ),
    );
  }

  void changeTab(selectedDrawer) {
    drawerTab = selectedDrawer;
    setState(() {});
    category = null;
    Navigator.of(context).pop();
  }

  void chooseCategory(selectedCategory) {
    category = selectedCategory;
    setState(() {});
  }
}
