import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/operations/domain/repositories/account_statment_repository.dart';

abstract class AccountStatmentUseCase { 
  Future <Either<Failure , String >> accountStatmentUseCase ( String fromDate , String toDate , String storeId  , String ticketType );
}





class AccountStatmentUseCaseImp implements AccountStatmentUseCase {
  final AccountStatmentRepository accountStatmentRepository ;

  AccountStatmentUseCaseImp(this.accountStatmentRepository);

  @override
  Future<Either<Failure, String>> accountStatmentUseCase(String fromDate, String toDate, String storeId, String ticketType) async {
  return await accountStatmentRepository.accountStatment(fromDate, toDate, storeId, ticketType);
  }
  
}