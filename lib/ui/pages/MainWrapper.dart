
import 'package:echnage_sp/ui/pages/HomePage.dart';
import 'package:echnage_sp/ui/pages/MarketViewPage.dart';
import 'package:echnage_sp/ui/pages/ProfilePage.dart';
import 'package:echnage_sp/ui/pages/WatchListPage.dart';
import 'package:flutter/material.dart';

import '../ui_helper/BottomNav.dart';
import '../ui_helper/ThemeSwitcher.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

  final PageController pageController =  PageController(initialPage: 0) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.compare_arrows_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  BottomNav(pageController: pageController,),
      body: PageView(
        controller: pageController,
        children: [
          HomePage() ,
         /* MarketViewPage() ,
          ProfilePage() ,
          WatchListPage()*/
        ],
      ),
    ) ;
  }
}
