import 'dart:convert';

import 'package:pharma/Core/error/exceptions.dart';
import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/Core/remote_data_function/http_methods.dart';

abstract class LoginRemoteData {
   Future <dynamic> login (String email  , String password );
}


class LoginRemoteDataImp implements LoginRemoteData {
  final NetworkFunctions networkFunctions ;
  final NetworkInf networkInf;

  LoginRemoteDataImp(this.networkFunctions, this.networkInf);

  @override
  Future login(String email, String password) async {
    var response  = await networkFunctions.getMethod(baseurl: networkInf.baseUrl,url: '/GetToken/$email/$password');
    var result = json.decode(response);
    if (result['AZSVR']=='SUCCESS'){
      return result['api_token'];
    }
    else {
      throw ServerException(result['Reason']);
    }

  } 
}