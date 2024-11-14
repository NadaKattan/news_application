import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';

class SourceItem extends StatelessWidget {
  SourceItem({required this.SourceName, required this.isSelected, super.key});
  String SourceName;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.primary),
          color: isSelected ? AppTheme.primary : AppTheme.white,
          borderRadius: BorderRadius.circular(20),),
      child: Text(
        SourceName,
        style: TextStyle(color: isSelected ? AppTheme.white : AppTheme.primary),
      ),
    );
  }
}
