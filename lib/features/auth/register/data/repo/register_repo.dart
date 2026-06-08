import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
   Future<Either<String,String>>register(
       {
         required String name,
         required String email,
         required String password,
         required String phone,
       }

   );
}