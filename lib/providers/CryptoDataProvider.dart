
import 'package:echnage_sp/models/CryptoModel/AllCryptoModel.dart';
import 'package:echnage_sp/network/ApiProvider.dart';
import 'package:echnage_sp/network/ResponseModel.dart';
import 'package:flutter/material.dart';

class CryptoDataProvider extends ChangeNotifier{

  ApiProvider apiProvider = ApiProvider() ;

  late AllCryptoModel dataFuture ;
  late ResponseModel state ;
  var response ;


  getTopMarketCapData() async
  {
    state = ResponseModel.loading("is Loading") ;
    try
    {
        response =  await apiProvider.getTopMarketCapData() ;

        if(response.statusCode == 200)
        {
          dataFuture = AllCryptoModel.fromJson(response.data) ;
          state = ResponseModel.completed(dataFuture) ;
        }
        else
        {
          state = ResponseModel.error("get data failed  , try again ") ;
        }

        notifyListeners() ;

    }
    catch(e)
    {
        state = ResponseModel.error("func has error :  "+ e.toString()) ;
        notifyListeners() ;

    }
  }


  getTopGainersData() async
  {
    state = ResponseModel.loading("is Loading") ;
    try
    {
      response =  await apiProvider.getTopGainersData() ;

      if(response.statusCode == 200)
      {
        dataFuture = AllCryptoModel.fromJson(response.data) ;
        state = ResponseModel.completed(dataFuture) ;
      }
      else
      {
        state = ResponseModel.error("get data failed  , try again ") ;
      }

      notifyListeners() ;

    }
    catch(e)
    {
      state = ResponseModel.error("func has error :  "+ e.toString()) ;
      notifyListeners() ;

    }
  }



  getTopLosersData() async
  {
    state = ResponseModel.loading("is Loading") ;
    try
    {
      response =  await apiProvider.getTopLosersData() ;

      if(response.statusCode == 200)
      {
        dataFuture = AllCryptoModel.fromJson(response.data) ;
        state = ResponseModel.completed(dataFuture) ;
      }
      else
      {
        state = ResponseModel.error("get data failed  , try again ") ;
      }

      notifyListeners() ;

    }
    catch(e)
    {
      state = ResponseModel.error("func has error :  "+ e.toString()) ;
      notifyListeners() ;

    }
  }


}