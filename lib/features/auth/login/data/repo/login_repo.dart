import 'package:dartz/dartz.dart';
import 'package:shop/features/auth/login/data/model/user_model.dart';

abstract class LoginRepo {
  Future<Either<String,UserModel>> login(
    {
      required String email,
      required String password,
    }
  );
}