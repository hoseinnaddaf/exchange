import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class ThemeProvider extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light ;

  bool get isDarkMode => themeMode == ThemeMode.dark  ;

  void toggleButton()
  {

    themeMode =  themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light ;

    debugPrint('theme mode :  $themeMode');


    notifyListeners() ;
    
  }

}
