import 'package:pharma/Core/error/exceptions.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/features/register/data/datasources/fetch_roles_remote_data.dart';
import 'package:pharma/features/register/data/models/roles_model.dart';
import 'package:pharma/features/register/domain/repositories/fetch_roles_repository.dart';

class RolesRepositoryImp implements RolesRepository{

  final FetchRolesRemoteData fetchRolesRemoteData;
  final NetworkInf networkInf ;

  RolesRepositoryImp(this.fetchRolesRemoteData, this.networkInf);

  @override
  Future<Either<Failure, RolesModel>> rolesRepository() async {

        if (await networkInf.isConnected) {
      try {
   
        final result =
            await fetchRolesRemoteData.fetchRoles();
             
        return Right((result));
      } on ServerException {
        return const Left(ServerFailure("Server Error"));
      }
    } else {
      return const Left(NetWorkFailure('check internet connection'));
    }
   
  }
  

}