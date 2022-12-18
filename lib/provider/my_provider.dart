import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languageCode='en';
  ThemeMode mode=ThemeMode.light;
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
  void changeTheme(ThemeMode modee){
    mode=modee;
    notifyListeners();
  }
  void changelang(String lang){
    languageCode=lang;
    notifyListeners();
  }
}