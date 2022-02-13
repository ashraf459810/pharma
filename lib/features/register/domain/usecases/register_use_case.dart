import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/Core/error/failures.dart';

import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';
import 'package:pharma/features/register/domain/repositories/register_repository.dart';

abstract class RegisterUseCase { 
  Future <Either<Failure,String>> registerUseCase (RegisterPharmaRequestodel registerPharmaRequestodel , List<XFile>  images);
}



class RegisterUseCaseImp implements RegisterUseCase {

  final RegisterRepository registerRepository;

  RegisterUseCaseImp(this.registerRepository);

  @override
  Future<Either<Failure, String>> registerUseCase(RegisterPharmaRequestodel registerPharmaRequestodel, List<XFile> images) async {
    return await registerUseCase(registerPharmaRequestodel, images);
  }
  
}
