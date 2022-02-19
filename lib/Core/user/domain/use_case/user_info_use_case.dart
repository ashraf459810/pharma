import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/Core/user/domain/repository/user_repository.dart';
import 'package:pharma/Core/user/domain/use_case/usecase.dart';

import 'package:dartz/dartz.dart';


class SaveToken implements UseCase<void, String> {
  final UserRepository userRepository;

  SaveToken(this.userRepository);
  @override
  Future<Either<Failure, void>> call(String params) async {
    await userRepository.setToken(params);
    return null;
  }
}

class GetToken implements UseCase<String, dynamic> {
  final UserRepository userRepository;

  GetToken(this.userRepository);
  @override
  Future<Either<Failure, String>> call(dynamic) async {
    String token = await userRepository.getToken();
    return right(token);
  }
}

class GetIsVerify implements UseCase<bool, void> {
   final UserRepository userRepository;

  GetIsVerify(this.userRepository);
  @override
  Future<Either<Failure, bool>> call(dynamic) async {
    await userRepository.getIsVerify();
    return null;
  }
}

class SetIsVerify implements UseCase<void, String> {
   final UserRepository userRepository;

  SetIsVerify(this.userRepository);
  @override
  Future<Either<Failure, void>> call(String parms) async {
    await userRepository.setIsVerify(parms);
    return null;
  }
}
