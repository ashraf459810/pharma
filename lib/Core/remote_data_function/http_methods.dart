import 'dart:convert';
import 'dart:developer';

import 'package:pharma/Core/error/exceptions.dart';


import 'package:http/http.dart' as http;



abstract class NetworkFunctions {
  Future<dynamic> getMethod({ String url,  String baseurl});
  Future<dynamic> postMethod(
      { String url,  String baseurl, dynamic body});
}

class NetworkFunctionsImp implements NetworkFunctions {
  http.Client client = http.Client();

  @override
  Future<dynamic> getMethod(
      { String url,  String baseurl}) async {
        
    
         

    log('here from htttp');
    final response = await client.get(
      Uri.parse(baseurl + url),
      headers: {
    
        'Content-Type': 'application/json',

      },
    );
    log(response.body.toString());
    log(baseurl + url);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log("200");
      return response.body;
    }
    if (response.statusCode == 500) {
      var res = json.decode(response.body);
     
      log("500 here");
      throw ServerException(
        res['error']["message"],
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future postMethod(
      { String url,  String baseurl, body}) async {
    final response = await client.post(Uri.parse(baseurl + url),
        headers: {

          'Content-Type': 'application/json',
        },
        body: body);

    log(baseurl + url);
    log(response.body);
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      log("200");
      return response.body;
    }
    if (response.statusCode == 500) {
      var res = json.decode(response.body);
      log(res["message"]);
      log("500 here");
      throw ServerException(
        res["message"],
      );
    } else {
      throw ServerException();
    }
  }
}
