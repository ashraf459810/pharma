import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/operations/data/models/pharmacy_tickets_model.dart';

abstract class PharmacyTicketsRepository {
  Future <Either<Failure,PharmacyTicketsModel >> pharmacyRepository ();
}

