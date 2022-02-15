import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/login/domain/repositories/login_repository.dart';

abstract class LoginUseCase {
  Future <Either <Failure , String >> loginUseCase ( String email , String passwrod );
}


class LoginUseCaseImp implements LoginUseCase {
  final LoginRepository loginRepository ;

  LoginUseCaseImp(this.loginRepository);

  @override
  Future<Either<Failure, String>> loginUseCase(String email, String passwrod) async {
    return await loginRepository.login(email, passwrod);
  }
  
}