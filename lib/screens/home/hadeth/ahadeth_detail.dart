import 'package:flutter/material.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/screens/home/hadeth/hadeth_tab.dart';
import 'package:provider/provider.dart';

import '../../../MyThemeData.dart';

class AhadethDetails extends StatelessWidget {
  static const String routeName = "ahadethDitail";

  @override
  Widget build(BuildContext context) {
    var provide=Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provide.getBackground()), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              args.title,
              style: TextStyle(color: provide.mode == ThemeMode.light
                  ? MyThemeData.BlackColor
                  : MyThemeData.WhiteColor, fontSize: 24),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            decoration: BoxDecoration(
              color:provide.mode == ThemeMode.light
                  ? MyThemeData.WhiteColor
                  : MyThemeData.primaryColorDark,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                itemCount: args.content.length,
                itemBuilder: (c, index) {
              return Text(
                args.content[index],
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.right,
              );
            }),
          )),
    );
  }
}
