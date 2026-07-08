import 'package:dartz/dartz.dart';
import 'package:shop/features/auth/login/data/model/user_model.dart';

abstract class UserDataRepo {
  Future<Either<String,UserModel>> getUserData();
  Future<Either<String, String>> updateProfile({
    required String name,
    required String phone,
    String? imagePath,
    });
}