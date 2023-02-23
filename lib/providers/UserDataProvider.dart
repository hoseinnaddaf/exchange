
import 'package:echnage_sp/models/CryptoModel/AllCryptoModel.dart';
import 'package:echnage_sp/models/UserModel.dart';
import 'package:echnage_sp/network/ApiProvider.dart';
import 'package:echnage_sp/network/ResponseModel.dart';
import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier{

  ApiProvider apiProvider = ApiProvider() ;

  late dynamic dataFuture ;
  ResponseModel?  registerStatus ;
  var loginStatus ;
  var error ;
  var response ;


  callRegisterApi(name , email , password) async
  {
    registerStatus = ResponseModel.loading("is Loading") ;
    notifyListeners() ;
    try
    {
      response =  await apiProvider.callRegisterApi(name, email, password) ;

      if(response.statusCode == 201)
      {
        dataFuture = UserModel.fromJson(response.data) ;
        registerStatus = ResponseModel.completed(dataFuture) ;
      }
      if(response.statusCode == 200)
      {
        dataFuture = UserModel.fromJson(response.data) ;
        registerStatus = ResponseModel.error(dataFuture.message) ;
      }
      else
      {
        registerStatus = ResponseModel.error("get data failed  , try again ") ;
      }

      notifyListeners() ;

    }
    catch(e)
    {
      registerStatus = ResponseModel.error("func has error :  "+ e.toString()) ;
      notifyListeners() ;

    }
  }




}