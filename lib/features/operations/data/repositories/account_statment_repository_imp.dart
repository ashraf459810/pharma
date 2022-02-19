import 'package:pharma/Core/error/exceptions.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/features/operations/data/datasources/account_statment_remote.dart';
import 'package:pharma/features/operations/domain/repositories/account_statment_repository.dart';

class AccountStatmentRepositoryImp implements AccountStatmentRepository{
  final AccountStatmentRemoteData accountStatmentRemoteData ;
  final NetworkInf networkInf ;

  AccountStatmentRepositoryImp(this.accountStatmentRemoteData, this.networkInf);

  @override
  Future<Either<Failure, String>> accountStatment(String fromDate, String toDate, String storeId, String ticketType,String userId) async {


             if (await networkInf.isConnected) {
      try {
        final result =
            await accountStatmentRemoteData.sendStatment(fromDate, toDate, storeId, ticketType, userId);
         

        return Right((result));
      } on ServerException {
        return  Left(ServerFailure('خطا في معالجة الطلب'));
      }
    } else {
      return const Left(NetWorkFailure('تحقق من الاتصال بالانترنت'));
    }

  }
}