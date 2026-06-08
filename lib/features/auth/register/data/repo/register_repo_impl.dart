import 'package:dartz/dartz.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/network/api_response.dart';
import 'package:shop/core/network/end_points.dart';
import 'package:shop/features/auth/register/data/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo{
  final ApiHelper apiHelper;
  RegisterRepoImpl(this.apiHelper);
  @override
  Future<Either<String, String>> register ({
    required String name,
    required String email,
    required String password,
    required String phone,
  })async {
     try {
       var response = await apiHelper.postRequest(endPoint: EndPoints.register,data:
     {
      "name":name,
      "email":email,
      "password":password,
      "phone":phone,
     }
      );
      if (response.status) {
        return Right(response.message);
      } else {
        return Left(response.message);
      }
     } catch (e) {
       return Left(ApiResponse.fromError(e).message);
     }
  }

}