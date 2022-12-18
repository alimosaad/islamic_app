import 'package:flutter/material.dart';
import 'package:islami_app/MyThemeData.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/screens/home/settings/languageSheet.dart';
import 'package:provider/provider.dart';


class SettingTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provid=Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Languag',style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 12,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet(context);
            },
            child: Container(

              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.OnprimaryColor),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(provid.languageCode=='en'?"English":"Arabic",style: Theme.of(context).textTheme.titleMedium,),
            ),
          ),
          SizedBox(height: 20,),
          Text('Theme',style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 12,),
          Container(

            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.OnprimaryColor),
                borderRadius: BorderRadius.circular(15)
            ),
            child: Text("light",style: Theme.of(context).textTheme.titleMedium,),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );

  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context){
      return LanguageBottobSheet();
    }
    );
  }
}
