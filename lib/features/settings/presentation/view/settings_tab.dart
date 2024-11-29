import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/features/settings/presentation/view_model/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class SettingsTab extends StatelessWidget {
//   const SettingsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text("Settings"),
//     );
//   }
// }

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  // const SettingsTab({super.key});
  List<Language> languages = [
    Language(languageCode: "en", languageName: "English"),
    Language(languageCode: "ar", languageName: "العربية"),
    // Language(languageCode: "es", languageName: "spanish"),
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<SettingsProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 70),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(AppLocalizations.of(context)!.title,
          //         style: Theme.of(context).textTheme.titleLarge),
          //     Switch(
          //         value: settingsProvider.isDark,
          //         onChanged: (value) => settingsProvider
          //             .changeTheme(value ? ThemeMode.dark : ThemeMode.light))
          //   ],
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.language,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                // hint: const Text('Select language'),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppTheme.primary, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppTheme.primary, width: 3),
                  ),
                ),
                value: settingsProvider.languageCode,
                items: languages
                    .map((language) => DropdownMenuItem(
                        value: language.languageCode,
                        child: Text(language.languageName,
                            style: Theme.of(context).textTheme.titleLarge)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    settingsProvider.changeLanguage(value);
                  }
                },
                // borderRadius: BorderRadius.circular(10),

                // dropdownColor: Provider.of<SettingsProvider>(context).isDark
                //     ? ThemeApp.darkPrimary
                //     : ThemeApp.white,
              )
            ],
          )
        ],
      ),
    );
  }
}

class Language {
  String languageName = "English";
  String languageCode = "en";
  Language({required this.languageName, required this.languageCode});
}
