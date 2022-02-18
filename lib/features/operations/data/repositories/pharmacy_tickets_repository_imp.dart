import 'package:pharma/Core/error/exceptions.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/features/operations/data/datasources/pharmacy_tickets_remote_data.dart';
import 'package:pharma/features/operations/data/models/pharmacy_tickets_model.dart';
import 'package:pharma/features/operations/domain/repositories/pharmact_tickets_repository.dart';

class PharmacyTicketsRepositoryImp implements PharmacyTicketsRepository {
  final PharmacyTicketsRemoteData pharmacyTicketsRemoteData;
  final NetworkInf networkInf ;

  PharmacyTicketsRepositoryImp(this.pharmacyTicketsRemoteData, this.networkInf);

  @override
  Future<Either<Failure, PharmacyTicketsModel>> pharmacyRepository() async {

                 if (await networkInf.isConnected) {
      try {
        final result =
            await pharmacyTicketsRemoteData.pharmacyTickets();
         

        return Right((result));
      } on ServerException {
        return  Left(ServerFailure('خطا في معالجة الطلب'));
      }
    } else {
      return const Left(NetWorkFailure('تحقق من الاتصال بالانترنت'));
    }
   
  }
}