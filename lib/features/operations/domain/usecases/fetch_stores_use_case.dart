

import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/operations/data/models/stores_model.dart';
import 'package:pharma/features/operations/domain/repositories/stores_repository.dart';

abstract class FetchStoresUseCase {
  Future <Either<Failure,StoresModel>> fetchStoresUseCase(); 
}


class FetchStoresUseCaseImp implements FetchStoresUseCase {
  final StoresRepository storesRepository ;

  FetchStoresUseCaseImp(this.storesRepository);

  @override
  Future<Either<Failure, StoresModel>> fetchStoresUseCase() async {
   return await storesRepository.fetchStores();
  }
}