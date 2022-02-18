import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/operations/data/models/stores_model.dart';

abstract class StoresRepository { 
  Future<Either<Failure,StoresModel>> fetchStores ();
}

