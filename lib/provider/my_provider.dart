import 'package:flutter/material.dart';
import 'package:islami_app/provider/sharedprefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyProvider extends ChangeNotifier{
  String languageCode='en';
  ThemeMode mode=ThemeMode.light;
  SharedPreferences? prefs;
  Future<void> initializeSharedpref() async {
    prefs= await SharedPreferences.getInstance();
  }

  String getBackground(){
    if (mode==ThemeMode.light){
      return "assets/images/bg3.png";
    }
    else{
      return "assets/images/bg.png";
    }
  }
  String headSebha(){
    if (mode==ThemeMode.light){
      return "assets/images/head of seb7a.png";
    }
    else{
      return "assets/images/head_of_seb7a_dark.png";
    }
  }
  String bodySebha(){
    if (mode==ThemeMode.light){
      return "assets/images/body of seb7a.png";
    }
    else{
      return "assets/images/body_of_seb7a_dark.png";
    }
  }
  void getThemeAndLang(){
    String language=Shared.prefs?.getString("lang")??"en";
    languageCode=language;
    String theme=Shared.prefs?.getString("theme")??"$mode";
    if(theme=='$mode'){
      mode=ThemeMode.light;
    }
    else{
      mode=ThemeMode.dark;
    }





  }
  void changeTheme(ThemeMode modee){
    mode=modee;
    Shared.prefs?.setString("theme", "$modee");
    notifyListeners();
  }
  void changelang(String lang){
    languageCode=lang;
    Shared.prefs?.setString("lang", lang);
    notifyListeners();
  }
}