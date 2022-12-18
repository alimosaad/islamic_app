import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/screens/home/quran/sura_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class QuranTab extends StatelessWidget {
  List<String> sura_names=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    var provide=Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset("assets/images/Screenshot (1).png"),
          Divider(
            color: provide.mode == ThemeMode.light
                ? MyThemeData.primaryColor
                : MyThemeData.YellowColor,
            thickness: 3,
          ),
          Text(
            AppLocalizations.of(context)!.sura_name,
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
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index)=>Divider(
                indent: 25,
                endIndent: 25,
              ),
              itemCount: sura_names.length,
                itemBuilder: (_,index){
              return SuraNameItem(sura_names[index],index);
            }),
          )
        ],
      ),
    );
  }
}
