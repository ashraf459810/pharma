

import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/Core/remote_data_function/http_methods.dart';
import 'package:pharma/features/operations/data/models/pharmacy_tickets_model.dart';

abstract class PharmacyTicketsRemoteData  {
  Future pharmacyTickets ();
}


class PharmacyTicketsRemoteDataImp implements PharmacyTicketsRemoteData{
  final NetworkInf networkInf;
  final NetworkFunctions networkFunctions;

  PharmacyTicketsRemoteDataImp(this.networkInf, this.networkFunctions);

  @override
  Future pharmacyTickets() async {
   var response = await networkFunctions.getMethod(url: '/Misc/getTicketTypes',baseurl: networkInf.baseUrl);
   return pharmacyTicketsModelFromJson(response);
  }
}