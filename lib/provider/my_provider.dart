import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languageCode='en';
  void changelang(String lang){
    languageCode=lang;
    notifyListeners();
  }
}