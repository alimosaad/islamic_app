import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/screens/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/screens/home/quran/quran_tab.dart';
import 'package:islami_app/screens/home/radio/radio_tab.dart';
import 'package:islami_app/screens/home/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/screens/home/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(), RadioTab(),SettingTab()];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
              AppLocalizations.of(context)!.apptitle,
            style: TextStyle(color: MyThemeData.BlackColor, fontSize: 24),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Theme(
          data:
              Theme.of(context).copyWith(canvasColor: MyThemeData.primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (clickedIndex) {
              selectedIndex = clickedIndex;
              setState(() {});
            },
            selectedItemColor: MyThemeData.BlackColor,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/moshaf_gold.png"),size: 25,),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/Path 1.png"),size: 25,),
                  label: "Hadeth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha_blue.png"),size: 25,),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio_blue.png"),size: 25,),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings,size: 25,),
                  label: "Settings"),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
