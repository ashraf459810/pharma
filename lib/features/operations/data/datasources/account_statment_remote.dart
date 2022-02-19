import 'dart:convert';

import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/Core/remote_data_function/http_methods.dart';

abstract class AccountStatmentRemoteData  {
  Future sendStatment (String fromDate , String toDate  , String storeId , String ticketType,String userId);
}

class AccountStatmentRemoteDataImp implements AccountStatmentRemoteData {
  final NetworkFunctions networkFunctions ; 
  final NetworkInf networkInf ;

  AccountStatmentRemoteDataImp(this.networkFunctions, this.networkInf);

  @override
  Future sendStatment(String fromDate, String toDate, String storeId, String ticketType,String userid) async {
 
    var response = await networkFunctions.postMethod(baseurl: networkInf.baseUrl , url:  '/NewTicket?from_date=$fromDate&to_date=$toDate&warehouses_id=$storeId&ticket_types_id=$ticketType&api_token=$userid');
  var result =json.decode(response);
  return result['AZSVR'];
  } 
  
}