
import 'package:dio/dio.dart';

class ApiProvider
{

  dynamic getAllCryptoData() async
  {
    var response  ;

    var url ='https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=500&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap' ;
    response = await Dio().get(url) ;

    return response ;

  }

  dynamic getTopMarketCapData() async
  {
    var response  ;

    var url ='https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=25&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap' ;
    response = await Dio().get(url) ;

    return response ;

  }
  dynamic getTopGainersData() async
  {
    var response  ;

    var url ='https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=25&sortBy=percent_change_24h&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap' ;
    response = await Dio().get(url) ;

    return response ;

  }

  dynamic getTopLosersData() async
  {
    var response  ;

    var url ='https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=25&sortBy=percent_change_24h&sortType=asc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap' ;
    response = await Dio().get(url) ;

    return response ;

  }

  dynamic callRegisterApi(name , email , password) async
  {
    var formData =  FormData.fromMap({
          'name'     : name  ,
          'email'    : email  ,
          'password' : password  ,

    });

    var url = 'https://besenior.ir/api/register';

    final respone =  await Dio().post(
        url,
        data: formData
    ) ;

    return respone ;
  }


}