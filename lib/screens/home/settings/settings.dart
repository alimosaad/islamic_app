import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/screens/home/settings/languageSheet.dart';
import 'package:islami_app/screens/home/settings/themeModeBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provid = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.OnprimaryColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                provid.languageCode == 'en'
                    ? AppLocalizations.of(context)!.english
                    : AppLocalizations.of(context)!.arabic,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showThemeModeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.OnprimaryColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                provid.mode == ThemeMode.light
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(

        context: context,
        builder: (context) {

          return LanguageBottobSheet();
        });
  }

  void showThemeModeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeModeBottomSheet();
        });
  }
}
