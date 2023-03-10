import 'package:echnage_sp/providers/CryptoDataProvider.dart';
import 'package:echnage_sp/providers/MarketViewProvider.dart';
import 'package:echnage_sp/providers/ThemeProvider.dart';
import 'package:echnage_sp/providers/UserDataProvider.dart';
import 'package:echnage_sp/ui/pages/MainWrapper.dart';
import 'package:echnage_sp/ui/pages/SignUpScreen.dart';
import 'package:echnage_sp/ui/theme/MyThem.dart';
import 'package:echnage_sp/ui/ui_helper/themeSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]) ;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => CryptoDataProvider()),
      ChangeNotifierProvider(create: (_) => MarketViewProvider()),
      ChangeNotifierProvider(create: (_) => UserDataProvider()),

    ],
    child: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder:(context , themeprovider,  child )
        {
          return MaterialApp(
            themeMode: themeprovider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            home: Directionality(
                textDirection: TextDirection.ltr,
                /*child: MainWrapper()*/
                child: SignUpScreen()
            ),
          ) ;
        } );



  }
}
