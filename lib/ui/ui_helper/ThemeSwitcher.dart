import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/ThemeProvider.dart';

class ThemeSitcher extends StatelessWidget {
  const ThemeSitcher ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context) ;
    var switchIcon =  Icon(themeProvider.isDarkMode ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill);

    return IconButton(
        onPressed:() {

          themeProvider.toggleButton() ;
        },
        icon: switchIcon);
  }
}
