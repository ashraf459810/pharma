import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';

abstract class AccountStatmentRepository {
  Future<Either<Failure , String >> accountStatment(String fromDate , String toDate , String storeId  , String ticketType);
}