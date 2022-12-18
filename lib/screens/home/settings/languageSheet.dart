import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottobSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            provider.changelang('en');
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "English",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: provider.languageCode == 'en'
                        ? MyThemeData.primaryColor
                        : MyThemeData.BlackColor),
              ),
              Icon(Icons.done,
                  size: 30,
                  color: provider.languageCode == 'en'
                      ? MyThemeData.primaryColor
                      : MyThemeData.BlackColor)
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            provider.changelang('ar');
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Arabic",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: provider.languageCode == 'ar'
                        ? MyThemeData.primaryColor
                        : MyThemeData.BlackColor),
              ),
              Icon(Icons.done,
                  size: 30,
                  color: provider.languageCode == 'ar'
                      ? MyThemeData.primaryColor
                      : MyThemeData.BlackColor)
            ],
          ),
        ),
      ],
    );
  }
}
