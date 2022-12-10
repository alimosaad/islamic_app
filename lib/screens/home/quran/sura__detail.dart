import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../MyThemeData.dart';

class SuraDetail extends StatefulWidget {
  static const String routeName = "sura_detail";

  @override
  State<SuraDetail> createState() => _SuraDetailState();
}

class _SuraDetailState extends State<SuraDetail> {
  List<String> aya = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(aya.isEmpty){
      loadFile(args.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            args.suraName,
            style: TextStyle(color: MyThemeData.BlackColor, fontSize: 24),
          ),
        ),
        body:aya.length==0?Center(child: CircularProgressIndicator()):
        ListView.builder(
            itemCount: aya.length,
            itemBuilder: (context, index) {
              return Text("${aya[index]}");
            }),
      ),
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split('\n');
    aya=lines;
    setState(() {

    });
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}
