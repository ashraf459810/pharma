import 'package:pharma/Core/error/exceptions.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pharma/Core/network/network_info.dart';
import 'package:pharma/features/operations/data/datasources/fetch_stores_remote_data.dart';
import 'package:pharma/features/operations/data/models/stores_model.dart';
import 'package:pharma/features/operations/domain/repositories/stores_repository.dart';

class StoresRepositoryImp implements StoresRepository {
  final NetworkInf networkInf ;
  final FetchStoresRemoteData fetchStoresRemoteData ;

  StoresRepositoryImp(this.networkInf, this.fetchStoresRemoteData);

  @override
  Future<Either<Failure, StoresModel>> fetchStores() async {
           if (await networkInf.isConnected) {
      try {
        final result =
            await fetchStoresRemoteData.fetchStores();
         

        return Right((result));
      } on ServerException {
        return  Left(ServerFailure('خطا في معالجة الطلب'));
      }
    } else {
      return const Left(NetWorkFailure('تحقق من الاتصال بالانترنت'));
    }
  }
}

