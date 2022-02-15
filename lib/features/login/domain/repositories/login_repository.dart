import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';

abstract class LoginRepository {
  Future <Either<Failure ,String >> login (String email , String passwrod);
}