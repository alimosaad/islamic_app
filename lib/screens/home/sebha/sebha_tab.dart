import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';

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
                        'assets/images/head of seb7a.png',
                        width: width * 0.2,
                        height: height * 0.11,
                      )),
                  Positioned(
                      top: height * 0.1,
                      child: Transform.rotate(
                          angle: angle,
                          child:
                              Image.asset('assets/images/body of seb7a.png'))),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
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
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor),
              child: Text(
                tasbeh[tasbehCount],
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
