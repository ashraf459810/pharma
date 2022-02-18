import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/register/data/models/roles_model.dart';
import 'package:pharma/features/register/domain/repositories/fetch_roles_repository.dart';

abstract class FetchRolesUseCase {

  Future <Either<Failure,RolesModel >>fetchRolesUseCase ();
 

}


class FetchRolesUseCaseImp implements FetchRolesUseCase {
   final RolesRepository repository ;

  FetchRolesUseCaseImp(this.repository);

  @override
  Future<Either<Failure, RolesModel>> fetchRolesUseCase() async {
    return await repository.rolesRepository();
  }
}