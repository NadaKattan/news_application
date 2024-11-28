import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({required this.onItemSelected, super.key});
  void Function(DrawerTabs selectedDrawer) onItemSelected;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: screenSize.width * 0.7,
      color: AppTheme.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: screenSize.height * .2,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppTheme.primary,
            ),
            child: Text(
              AppLocalizations.of(context)!.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 20, start: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () => onItemSelected(DrawerTabs.generalTab),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.newspaper,
                        size: 34,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppLocalizations.of(context)!.general,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppTheme.black,
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => onItemSelected(DrawerTabs.categoriesTab),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.list,
                        size: 34,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppLocalizations.of(context)!.categories,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: AppTheme.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => onItemSelected(DrawerTabs.settingsTab),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 34,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppLocalizations.of(context)!.settings,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppTheme.black,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
