import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int tasbehCount = 0;
  double angle = 0;
  List<String> tasbeh = ["سبحان الله", "الحمد لله", "الله اكبر"];

  void incCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provide=Provider.of<MyProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
              height: height * 0.45,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      left: width * 0.45,
                      bottom: height * 0.32,
                      child: Image.asset(
                        provide.headSebha(),
                        width: width * 0.2,
                        height: height * 0.11,
                      )),
                  Positioned(
                      top: height * 0.1,
                      child: Transform.rotate(
                          angle: angle,
                          child:
                              Image.asset( provide.bodySebha()))),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            'عدد التسبيحات',
            style: TextStyle(color: provide.mode == ThemeMode.light
                ? MyThemeData.BlackColor
                : MyThemeData.WhiteColor, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: provide.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.primaryColorDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: TextStyle(
                    color: provide.mode == ThemeMode.light
                    ? MyThemeData.BlackColor
                    : MyThemeData.WhiteColor, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              if (counter == 33) {
                counter = 0;
                if (tasbehCount == tasbeh.length - 1) {
                  tasbehCount = 0;
                } else {
                  tasbehCount++;
                }
              } else {
                counter++;
              }
              angle+=21.7;
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                color: provide.mode == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.YellowColor,),
              child: Text(
                tasbeh[tasbehCount],
                style: TextStyle(color: provide.mode == ThemeMode.light
                    ? MyThemeData.WhiteColor
                    : MyThemeData.BlackColor, fontSize: 24),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
