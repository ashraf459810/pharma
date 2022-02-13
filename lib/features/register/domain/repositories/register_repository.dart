import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/Core/error/failures.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure,String>> register(RegisterPharmaRequestodel registerPharmaRequestodel , List<XFile> imagess);
}