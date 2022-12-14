import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/hadeth/hadeth_tab.dart';

import '../../../MyThemeData.dart';

class AhadethDetails extends StatelessWidget {
  static const String routeName = "ahadethDitail";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              args.title,
              style: TextStyle(color: MyThemeData.BlackColor, fontSize: 24),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
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
