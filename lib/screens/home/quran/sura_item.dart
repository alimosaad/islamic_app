import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/quran/sura__detail.dart';

class SuraNameItem extends StatelessWidget {
  String name;
  int index;
  SuraNameItem(this.name,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, SuraDetail.routeName,arguments: SuraDetailsArgs(name,index));
        },
        child: Text(name,textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium));
  }
}
