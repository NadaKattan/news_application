import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/constants.dart';
import 'package:news_application/features/category/data/models/category_model.dart';
import 'package:news_application/features/category/presentation/view/widgets/categories_tab.dart';
import 'package:news_application/features/category/presentation/view/widgets/category_details.dart';
import 'package:news_application/features/general/presentation/view/custom_search_delegate.dart';
import 'package:news_application/features/general/presentation/view/news_gen_list.dart';
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
  // List<CategoryModel> categories = [
  //   CategoryModel(
  //       id: "sports",
  //       imageName: "assets/images/ball.png",
  //       name: "Sports",
  //       color: AppTheme.red),
  //   CategoryModel(
  //       id: "health",
  //       imageName: "assets/images/health.png",
  //       name: "Health",
  //       color: const Color(0xffED1E79)),
  //   CategoryModel(
  //       id: "science",
  //       imageName: "assets/images/science.png",
  //       name: "Science",
  //       color: const Color(0xff4882CF)),
  //   CategoryModel(
  //       id: "entertainment",
  //       imageName: "assets/images/entertainment.png",
  //       name: "Entertainment",
  //       color: Colors.amber),
  //   CategoryModel(
  //       id: "technology",
  //       imageName: "assets/images/tech.png",
  //       name: "Technology",
  //       color: const Color(0xffF2D352)),
  //   CategoryModel(
  //       id: "business",
  //       imageName: "assets/images/bussines.png",
  //       name: "Business",
  //       color: const Color(0xffCF7E48)),
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        // image: DecorationImage(
        //   image: AssetImage("assets/images/pattern.png"),
        // ),
      ),
      child: Scaffold(
        backgroundColor: AppTheme.scaffoldColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(categories
                        .map(
                          (e) => e.name,
                        )
                        .toList()),
                    // query: "search",
                  );
                  setState(() {
                    AppTheme.scaffoldColor = Colors.white;
                  });
                },
                icon: const Icon(Icons.search)),
            const SizedBox(
              width: 16,
            ),
          ],
          title: Text(
            "News App",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppTheme.white),
          ),
          // foregroundColor: Colors.white,
        ),
        // floatingActionButton: Builder(
        //   builder: (context) => FloatingActionButton(
        //     child: const Icon(Icons.search),
        //     onPressed: () async {
        //       await showSearch(
        //         context: context,
        //         delegate: CustomSearchDelegate(categories
        //             .map(
        //               (e) => e.name,
        //             )
        //             .toList()),
        //         // query: "hello",
        //       );
        //     },
        //   ),
        // ),
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
                : drawerTab == DrawerTabs.settingsTab
                    ? const SettingsTab()
                    : const NewsGenList("a"),
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
