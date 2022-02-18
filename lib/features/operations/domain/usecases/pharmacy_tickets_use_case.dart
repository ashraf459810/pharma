import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/operations/data/models/pharmacy_tickets_model.dart';
import 'package:pharma/features/operations/domain/repositories/pharmact_tickets_repository.dart';

abstract class PharmacyTicketsUseCase  {
  Future <Either<Failure,PharmacyTicketsModel >> pharmacyTicketsUseCase();
}




class PharmacyTicketsUseCaseImp implements PharmacyTicketsUseCase{
  final PharmacyTicketsRepository pharmacyTicketsRepository;

  PharmacyTicketsUseCaseImp(this.pharmacyTicketsRepository);

  @override
  Future<Either<Failure, PharmacyTicketsModel>> pharmacyTicketsUseCase() async {
    return await pharmacyTicketsRepository.pharmacyRepository();
    
  }
}