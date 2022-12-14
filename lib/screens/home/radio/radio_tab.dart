import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset("assets/images/radio_main.png"),
        SizedBox(
          height: 50,
        ),
        Text(
          "إذاعة القرآن الكريم",
          style: Theme.of(context).textTheme.headlineSmall,
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
                      color: MyThemeData.primaryColor,
                      size: 40,
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.play_arrow,
                      color: MyThemeData.primaryColor,
                      size: 40,
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.skip_next,
                      color: MyThemeData.primaryColor,
                      size: 40,
                    )))
          ],
        ),
        Spacer(),
      ],
    );
  }
}
