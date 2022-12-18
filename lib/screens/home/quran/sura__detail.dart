import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/provider/sura_provider.dart';
import 'package:islami_app/screens/home/quran/ayaat.dart';
import 'package:provider/provider.dart';

import '../../../MyThemeData.dart';

class SuraDetail extends StatelessWidget {
  static const String routeName = "sura_detail";

  @override
  Widget build(BuildContext context) {
    var provide=Provider.of<MyProvider>(context);
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;


    return ChangeNotifierProvider(
      create: (context)=>SuraProvider()..loadFile(args.index),
      builder: (context,child){
        var provider=Provider.of<SuraProvider>(context);

        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(provide.getBackground()), fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                args.suraName,
                style: TextStyle(color: provide.mode == ThemeMode.light
                    ? MyThemeData.BlackColor
                    : MyThemeData.WhiteColor, fontSize: 24),
              ),
            ),
            body:provider.aya.length==0?Center(child: CircularProgressIndicator()):
            Container(
              decoration: BoxDecoration(
                  color:provide.mode == ThemeMode.light
                      ? MyThemeData.WhiteColor
                      : MyThemeData.primaryColorDark,
                  border: Border.all(
                      color: provide.mode == ThemeMode.light
                          ? MyThemeData.WhiteColor
                          : MyThemeData.primaryColorDark
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
              child: ListView.separated(
                  separatorBuilder: (c,index){
                    return Divider(
                      color: MyThemeData.BlackColor,
                      indent: 30,
                      endIndent: 30,
                    );
                  },
                  itemCount: provider.aya.length,
                  itemBuilder: (context, index) {
                    return AyaItem("${provider.aya[index]}");
                  }),
            ),
          ),
        );
      },
    );
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}
