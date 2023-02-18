

import 'package:echnage_sp/ui/ui_helper/HomePageView.dart';
import 'package:echnage_sp/ui/ui_helper/themeSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {

  final PageController _pageController =  PageController(
    initialPage: 0
  ) ;

   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var primaryColor =  Theme.of(context).primaryColor ;
    var textTheme = Theme.of(context).textTheme ;
    
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          actions: [
            ThemeSitcher()
          ],
          title: Text('Exchange'),

        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                 Padding(
                     padding: const EdgeInsets.only(top: 10.0 , left: 5.0 ,  right:  5.0),
                      child: SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: Stack(
                            children: [
                              HomePageView(controller: _pageController) ,
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: SmoothPageIndicator(
                                    controller: _pageController,
                                    count: 4 ,
                                    effect: const ExpandingDotsEffect(
                                      dotWidth: 10 ,
                                      dotHeight: 10 ,
                                    ),
                                    onDotClicked :(index)=> _pageController.animateToPage(index, duration: const Duration(milliseconds: 3000), curve: Curves.easeInOut),
                                  )
                                  ,
                                ),
                              )
                            ],
                        ),
                      ),
                 ),

              ],
            ),
          ),
        )
    );
  }
}
