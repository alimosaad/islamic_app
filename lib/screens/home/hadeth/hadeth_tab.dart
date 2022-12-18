import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/screens/home/hadeth/ahadeth_detail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethData> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    var provide=Provider.of<MyProvider>(context);
    if (Ahadeth.isEmpty) {
      loadHadeth();
    }
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset("assets/images/ahadeth_main.png"),
          Divider(
            color: provide.mode == ThemeMode.light
                ? MyThemeData.primaryColor
                : MyThemeData.YellowColor,
            thickness: 3,
          ),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            style: TextStyle(color: provide.mode == ThemeMode.light
                ? MyThemeData.BlackColor
                : MyThemeData.WhiteColor, fontSize: 24),
          ),
          Divider(
            color: provide.mode == ThemeMode.light
                ? MyThemeData.primaryColor
                : MyThemeData.YellowColor,
            thickness: 3,
          ),
          Ahadeth.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            indent: 25,
                            endIndent: 25,
                          ),
                      itemCount: Ahadeth.length,
                      itemBuilder: (c, iindex) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AhadethDetails.routeName,
                                  arguments: Ahadeth[iindex]);
                            },
                            child: Text(
                              Ahadeth[iindex].title,
                              style: TextStyle(color: provide.mode == ThemeMode.light
                                  ? MyThemeData.BlackColor
                                  : MyThemeData.WhiteColor, fontSize: 25),
                              textAlign: TextAlign.center,
                            ));
                      }),
                )
        ],
      ),
    );
  }

  void loadHadeth() async {
    String content = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> allAhadeth = content.split('#\r\n');
    for (int i = 0; i < allAhadeth.length; i++) {
      String hadeth1 = allAhadeth[i];
      List<String> hadethLines = hadeth1.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethLines);
      Ahadeth.add(hadethData);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  List<String> content;

  HadethData(this.title, this.content);
}
