import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provide=Provider.of<MyProvider>(context);
    return Column(
      children: [
        Spacer(),
        Image.asset("assets/images/radio_main.png"),
        SizedBox(
          height: 50,
        ),
        Text(
          "إذاعة القرآن الكريم",
          style:TextStyle(color: provide.mode == ThemeMode.light
              ? MyThemeData.BlackColor
              : MyThemeData.WhiteColor, fontSize: 24),

        ),
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.skip_previous,
                      color: provide.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.YellowColor,
                      size: 40,
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.play_arrow,
                      color: provide.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.YellowColor,
                      size: 40,
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.skip_next,
                      color: provide.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.YellowColor,
                      size: 40,
                    )))
          ],
        ),
        Spacer(),
      ],
    );
  }
}
