

import 'package:echnage_sp/ui/ui_helper/HomePageView.dart';
import 'package:echnage_sp/ui/ui_helper/themeSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController =  PageController(
    initialPage: 0
  ) ;

  var defaultChoiseIndex = 0 ;

  final List<String> _choiseList = ['Top MarketCaps' , 'Top Gainers' , 'Top Losers'] ;

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
                SizedBox(height: 5,) ,
                SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Marquee(
                        text: " - this place for news in application",
                        style: textTheme.bodySmall,
                    ),
                  ) ,
                SizedBox(height: 5,) ,
                Padding(
                  padding: const EdgeInsets.only(left: 5 , right: 5),
                  child: Row(
                    children: [
                      Expanded(
                          child:ElevatedButton(
                            onPressed: (){},
                            child: Text("Buy"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))) ,
                              padding: EdgeInsets.all(15) ,
                              primary: Colors.green[700]
                            ),
                          ) ,
                      ) ,
                      SizedBox(width: 5,) ,
                      Expanded(
                        child:ElevatedButton(
                          onPressed: (){},
                          child: Text("Sell"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              padding: EdgeInsets.all(15) ,
                              primary: Colors.red[700]
                          ),
                        ) ,
                      ) ,
                    ],
                  ),
                ) ,
                Padding(
                  padding: EdgeInsets.only(right: 5 , left: 5) ,
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 8,
                        children: List.generate( _choiseList.length, (index)  {
                              return ChoiceChip(
                                  label: Text(_choiseList[index] , style: textTheme.titleSmall,),
                                  selected:defaultChoiseIndex == index ,
                                  selectedColor: Colors.blue,
                                  disabledColor: Colors.grey[200],
                                  onSelected: (value){
                                      setState((){
                                        defaultChoiseIndex = value ? index : defaultChoiseIndex ;  
                                      }) ;
                                  },
                              );

                          }) ,

                      )
                    ],
                  ),
                )


              ],
            ),
          ),
        )
    );
  }
}
