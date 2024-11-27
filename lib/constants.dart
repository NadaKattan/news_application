
import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/features/category/data/models/category_model.dart';

enum DrawerTabs { categoriesTab, settingsTab, generalTab }
List<CategoryModel> categories = [
    CategoryModel(
        id: "sports",
        imageName: "assets/images/ball.png",
        name: "Sports",
        color: AppTheme.red),
    CategoryModel(
        id: "health",
        imageName: "assets/images/health.png",
        name: "Health",
        color: const Color(0xffED1E79)),
    CategoryModel(
        id: "science",
        imageName: "assets/images/science.png",
        name: "Science",
        color: const Color(0xff4882CF)),
    CategoryModel(
        id: "entertainment",
        imageName: "assets/images/entertainment.png",
        name: "Entertainment",
        color: Colors.amber),
    CategoryModel(
        id: "technology",
        imageName: "assets/images/tech.png",
        name: "Technology",
        color: const Color(0xffF2D352)),
    CategoryModel(
        id: "business",
        imageName: "assets/images/bussines.png",
        name: "Business",
        color: const Color(0xffCF7E48)),
  ];
  