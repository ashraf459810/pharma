

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pharma/Core/error/exceptions.dart';
import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/Core/remote_data_function/http_methods.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';


abstract class RegisterPharmacyRemoteData {

  
 
  Future<dynamic> registerPharmacy(RegisterPharmaRequestodel registerPharmaRequestodel, List<XFile> image);
}



class RegisterPharmacyRemoteDataImp implements RegisterPharmacyRemoteData {
  final NetworkInf networkInf;
final  NetworkFunctions networkFunctions;

  RegisterPharmacyRemoteDataImp(this.networkInf, this.networkFunctions);

  @override
  Future registerPharmacy(RegisterPharmaRequestodel registerPharmaRequestodel, List<XFile> image) async {


     dynamic result ;

    var link = '/Register?CHECK_BODY_FORM_DATA=CHECK_BODY_FORM_DATA';

    List<String> files = ['SejelTejaryFile[]', 'RokhsatMehanFile[]','HaweyaFile[]','MwafaqaFile[]', 'MozawalaFile[]'];

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(networkInf.baseUrl + link));

    for (int i = 0; i < image.length; i++) {
      var pic = await http.MultipartFile.fromPath(files[i], image[i].path);

      request.files.add(pic);
    }
    request.fields["existing"]=registerPharmaRequestodel.existing;

     request.fields["belongable_type"] = registerPharmaRequestodel.belongType;

    request.fields[ "name"] =  registerPharmaRequestodel.name;
    request.fields[ "phone"] = registerPharmaRequestodel.phone;
    request.fields[ "email"] = registerPharmaRequestodel.email;
   request.fields  ["password"] =registerPharmaRequestodel.password;
     request.fields["belongable_name"] = registerPharmaRequestodel.belongableName ;
    request.fields[ "belongable_phone"] = registerPharmaRequestodel.belongablePhone;
    request.fields[ "belongable_location"]= registerPharmaRequestodel.belongableLocation;
    request.fields ["account_roles_id" ]= registerPharmaRequestodel.accountRolesId;
   

    final response = await request.send();

    response.stream.transform(utf8.decoder).listen((value) {
     result = value;
    });

    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      return result['AZSVR'];
    }
    if (response.statusCode == 500) {
      throw ServerException("Error while downloading");
    } else {
      throw ServerException();
    }

    
  }
}