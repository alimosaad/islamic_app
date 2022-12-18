import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../MyThemeData.dart';
import '../../../provider/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ThemeModeBottomSheet extends StatelessWidget {
  const ThemeModeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: provider.mode == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.BlackColor),
                  ),
                  Spacer(),
                  Icon(Icons.done,
                      size: 30,
                      color: provider.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.BlackColor)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: provider.mode == ThemeMode.dark
                            ? MyThemeData.YellowColor
                            : MyThemeData.BlackColor),
                  ),
                  Spacer(),
                  Icon(Icons.done,
                      size: 30,
                      color: provider.mode == ThemeMode.dark
                          ? MyThemeData.YellowColor
                          : MyThemeData.BlackColor)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}