import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/Core/user/data/local_data/user_local_data.dart';
import 'package:pharma/Core/user/domain/repository/user_repository.dart';



class UserRepositoryImp implements UserRepository {

  final NetworkInf networkInfo;

  final UserLocatData userLocatData;

  UserRepositoryImp(
       this.networkInfo, this.userLocatData);



  @override
  Future<bool> getIsVerify() async {
    return await userLocatData.getIfUserverfiy();
  }

  @override
  Future<String> getToken() async {
    return await userLocatData.getToken();
  }

  @override
  Future<void> setIsVerify(bool value) async {
    return await userLocatData.setUserverfiy(value);
  }

  @override
  Future<void> setToken(String token) async {
    return await userLocatData.saveToken(token);
  }
}
