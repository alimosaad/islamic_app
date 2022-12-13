import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/MyThemeData.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethData> Ahadeth=[];

  @override
  Widget build(BuildContext context) {
    if(Ahadeth.isEmpty) {
      loadHadeth();
    }
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset("assets/images/ahadeth_main.png"),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 3,
          ),
          Text(
            "Ahadeth",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 3,
          ),
          Ahadeth.isEmpty?Center(child: CircularProgressIndicator()):ListView.builder(
              itemCount: Ahadeth.length,
              itemBuilder: (c,index){

            return Text(Ahadeth[index].title);
          })

        ],
      ),
    );
  }

  void loadHadeth()async {
    String content = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> allAhadeth = content.split('#');
    for (int i = 0; i < allAhadeth.length; i++) {
      String hadeth1 = allAhadeth[i];
      List<String> hadethLines = hadeth1.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethLines);
      Ahadeth.add(hadethData);
    }
    setState(() {

    });
  }
}
class HadethData{
  String title;
  List<String> content;
  HadethData(this.title,this.content);
}
