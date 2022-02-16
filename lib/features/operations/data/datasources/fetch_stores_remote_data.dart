

import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/Core/remote_data_function/http_methods.dart';
import 'package:pharma/features/operations/data/models/stores_model.dart';

abstract class FetchStoresRemoteData {
    Future <dynamic> fetchStores ();
 }


 class FetchStoresRemoteDataImp implements FetchStoresRemoteData {
   final NetworkInf networkInf ;
   final NetworkFunctions networkFunctions ;

  FetchStoresRemoteDataImp(this.networkInf, this.networkFunctions);

  @override
  Future fetchStores() async {
    var response = await networkFunctions.getMethod(baseurl: networkInf.baseUrl , url: '/Warehouses?id&name');
    return storesModelFromJson(response);
  }
 }

 