import 'package:pharma/Core/error/exceptions.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/features/login/data/datasources/login_remote_data.dart';
import 'package:pharma/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteData loginRemoteData ;
  final NetworkInf networkInf;

  LoginRepositoryImp(this.loginRemoteData, this.networkInf);

  @override
  Future<Either<Failure, String>> login(String email, String passwrod) async {


         if (await networkInf.isConnected) {
      try {
        final result =
            await loginRemoteData.login(email, passwrod);
         

        return Right((result));
      } on ServerException {
        return  Left(ServerFailure('الايميل او كلمة المرور خطا'));
      }
    } else {
      return const Left(NetWorkFailure('تحقق من الاتصال بالانترنت'));
    }
    
  }
}