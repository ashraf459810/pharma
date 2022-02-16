import 'package:image_picker/image_picker.dart';
import 'package:pharma/Core/error/exceptions.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:dartz/dartz.dart';

import 'package:pharma/Core/network/network_info.dart';

import 'package:pharma/features/register/data/datasources/register_pharmacy_remote_data.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';
import 'package:pharma/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImp implements RegisterRepository {
  final NetworkInf networkInf;
  final RegisterPharmacyRemoteData registerPharmacyRemoteData ;

  RegisterRepositoryImp(this.networkInf, this.registerPharmacyRemoteData);

  @override
  Future<Either<Failure, String>> register(RegisterPharmaRequestodel registerPharmaRequestodel, List<XFile> imagess) async {
       if (await networkInf.isConnected) {
      try {
   
        final result =
            await registerPharmacyRemoteData.registerPharmacy(registerPharmaRequestodel, imagess);
             
        return Right((result));
      } on ServerException {
        return const Left(ServerFailure("Server Error"));
      }
    } else {
      return const Left(NetWorkFailure('check internet connection'));
    }
  }
}