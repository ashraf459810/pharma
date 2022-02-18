import 'package:dartz/dartz.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/register/data/models/roles_model.dart';

abstract class RolesRepository {
   Future <Either <Failure , RolesModel >> rolesRepository ();
}