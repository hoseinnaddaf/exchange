

import 'package:cached_network_image/cached_network_image.dart';
import 'package:echnage_sp/helpers/decimalRounder.dart';
import 'package:echnage_sp/models/CryptoModel/CryptoData.dart';
import 'package:echnage_sp/providers/CryptoDataProvider.dart';
import 'package:echnage_sp/ui/ui_helper/HomePageView.dart';
import 'package:echnage_sp/ui/ui_helper/themeSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../network/ResponseModel.dart';

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
  void initState() {
    super.initState() ;

    final cryptoProvider =  Provider.of<CryptoDataProvider>(context , listen: false  ) ;

    cryptoProvider.getTopMarketCapData() ;

  }

  @override
  Widget build(BuildContext context) {

    final cryptoProvider = Provider.of<CryptoDataProvider>(context);

    var primaryColor =  Theme.of(context).primaryColor ;
    var textTheme = Theme.of(context).textTheme ;

    var width =  MediaQuery.of(context).size.width ;
    var height =  MediaQuery.of(context).size.height ;

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
                                        switch(index)
                                        {
                                          case 0:
                                            cryptoProvider.getTopMarketCapData() ;
                                            break ;
                                          case 1:
                                            cryptoProvider.getTopGainersData() ;
                                            break ;
                                          case 2:
                                            cryptoProvider.getTopLosersData();
                                            break;
                                        }
                                      }) ;
                                  },
                              );

                          }) ,

                      )
                    ],
                  ),
                ) ,
                SizedBox(height: 5,) ,
                SizedBox(
                  height: 500,
                  child: Consumer<CryptoDataProvider>(
                      builder: (context, crypto , child ){
                        switch(crypto.state.status)
                        {
                          case Status.LOADING :
                              return SizedBox(
                                  height: 80,
                                  child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.white ,
                                      child: ListView.builder(
                                          itemCount: 25,
                                          itemBuilder: (context ,  index)
                                          {
                                             return Row(
                                               children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(top: 8 ,bottom: 8 , left: 8) ,
                                                      child: CircleAvatar(
                                                          backgroundColor: Colors.white,
                                                          radius: 30,
                                                          child: Icon(Icons.add),
                                                      ),
                                                  ) ,
                                                  Flexible(
                                                      fit:FlexFit.tight ,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(left: 8 , right: 8),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: 300,
                                                              height: 15,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(5) ,
                                                                  color: Colors.white ,
                                                                ),
                                                              ),
                                                            ) ,
                                                            Padding(
                                                                padding:EdgeInsets.only(top: 8) ,
                                                                child: SizedBox(
                                                                  width: 250,
                                                                  height: 15,
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(5) ,
                                                                      color: Colors.white ,
                                                                    ),
                                                                  ),

                                                                ),
                                                            )
                                                          ],
                                                        ),
                                                      ),

                                                  )
                                               ],
                                             )  ;
                                          }
                                      ),

                                  ),
                              );
                          case Status.COMPLETED :
                              List<CryptoData>? model = crypto.dataFuture.data!.cryptoCurrencyList ;
                              return ListView.separated(
                                  itemBuilder: (context ,index){

                                    var number = index + 1 ;
                                    var tokenId = model![index].id ;
                                    var tokenName =model[index].name.toString() ;
                                    var tokenSymbol =model[index].symbol.toString() ;

                                    MaterialColor filterColor =  DecimalRounder.setColorFilter(model[index].quotes![0].percentChange24h) ;
                                    var finalPrice = DecimalRounder.removePriceDecimals(model[index].quotes![0].price);

                                    // percent change setup decimals and colors
                                    var percentChange = DecimalRounder.removePercentDecimals(model[index].quotes![0].percentChange24h);

                                    Color percentColor = DecimalRounder.setPercentChangesColor(model[index].quotes![0].percentChange24h);
                                    Icon percentIcon = DecimalRounder.setPercentChangesIcon(model[index].quotes![0].percentChange24h);



                                    return SizedBox(
                                      height:height* 0.075,
                                      child: Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(left: 10) ,
                                              child: Text(number.toString() , style: textTheme.bodySmall,),

                                          ) ,
                                          Padding(
                                              padding:EdgeInsets.only(left: 10, right: 10) ,
                                              child: CachedNetworkImage(
                                                  fadeInDuration: Duration(milliseconds: 500),
                                                  height: 32,
                                                  width: 32,
                                                  imageUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/$tokenId.png",
                                                  placeholder: (context , url )=> CircularProgressIndicator(),
                                                  errorWidget: (context ,url ,error)=> Icon(Icons.error),
                                              ),
                                          ) ,
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(tokenName,style: textTheme.bodySmall,),
                                                Text(tokenSymbol,style: textTheme.labelSmall,),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(filterColor, BlendMode.srcATop),
                                                child: SvgPicture.network("https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenId.svg")),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("\$$finalPrice",style: textTheme.bodySmall,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      percentIcon,
                                                      Text(percentChange + "%",style: GoogleFonts.ubuntu(color: percentColor, fontSize: 13),),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ) ;
                                  },
                                  separatorBuilder: (context ,  index ){
                                    return Divider() ;
                                  },
                                  itemCount: model!.length) ;
                          case Status.ERROR :
                              return Text(crypto.state.message) ;
                          default:
                              return Container() ;

                        }
                      }
                  ),
                ) ,



              ],
            ),
          ),
        )
    );
  }
}
