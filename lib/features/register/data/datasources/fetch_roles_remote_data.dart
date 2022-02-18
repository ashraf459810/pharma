import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/Core/remote_data_function/http_methods.dart';
import 'package:pharma/features/register/data/models/roles_model.dart';

abstract class FetchRolesRemoteData {
   Future fetchRoles ();


}


class FetchRolesRemoteDateImp implements FetchRolesRemoteData {
  final NetworkInf networkInf ;
  final NetworkFunctions networkFunctions ;

  FetchRolesRemoteDateImp(this.networkInf, this.networkFunctions);

  @override
  Future fetchRoles() async {
    var response = await networkFunctions.getMethod(url: '/Misc/getAccountRoles',baseurl: networkInf.baseUrl);

    return rolesModelFromJson(response);
  }
}