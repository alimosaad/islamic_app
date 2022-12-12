import 'package:flutter/material.dart';

class AyaItem extends StatelessWidget {
  String ayat;
  AyaItem(this.ayat);

  @override
  Widget build(BuildContext context) {
    return Text(ayat,style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,);
  }
}
