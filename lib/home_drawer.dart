import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Expanded(
      child: Container(
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
                "News App!",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding:const EdgeInsetsDirectional.only(top: 20, start: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.list,
                        size: 34,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Categories",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: AppTheme.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 34,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Settings",
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppTheme.black,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
