import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/constants.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/tabs/categories_tab.dart';
import 'package:news_application/tabs/category_details.dart';
import 'package:news_application/tabs/sources_tabs.dart';
import 'package:news_application/tabs/settings_tab.dart';
import 'package:news_application/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerTabs drawerTab = DrawerTabs.categoriesTab;
  CategoryModel? category;
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
            ? CategoryDetails(categoryId: category?.id??"",)
            : drawerTab == DrawerTabs.categoriesTab
                ? CategoriesTab(
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
