import 'package:flutter/material.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/screens/home/quran/sura__detail.dart';
import 'package:provider/provider.dart';

import '../../../MyThemeData.dart';

class SuraNameItem extends StatelessWidget {
  String name;
  int index;
  SuraNameItem(this.name,this.index);

  @override
  Widget build(BuildContext context) {
    var provide=Provider.of<MyProvider>(context);
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, SuraDetail.routeName,arguments: SuraDetailsArgs(name,index));
        },
        child: Text(name,textAlign: TextAlign.center,
            style: TextStyle(color: provide.mode == ThemeMode.light
                ? MyThemeData.BlackColor
                : MyThemeData.WhiteColor, fontSize: 24)));
  }
}
