import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/network/api_response.dart';
import 'package:shop/core/network/end_points.dart';
import 'package:shop/features/auth/login/data/model/user_model.dart';
import 'package:shop/features/profile/data/repo/user_data_repo.dart';

class UserDataRepoImpl implements UserDataRepo {
  final ApiHelper apiHelper;

  UserDataRepoImpl(this.apiHelper);

  @override
  Future<Either<String, UserModel>> getUserData() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.getuserData,
      );
      print('--- User Response : ${response.data}');
      if (response.status) {
        var userData = UserModel.fromJson(response.data['user']);
        return Right(userData);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

  @override
  Future<Either<String, String>> updateProfile({
    required String name,
    required String phone,
    String? imagePath,
  }) async {
    try {
      var response = await apiHelper.putRequest(
        endPoint: EndPoints.updateProfile,
        data: {
          'name': name,
          'phone': phone,
          if (imagePath != null)
            'image': await MultipartFile.fromFile(
              imagePath,
              filename: imagePath.split('/').last,
            ),
        },
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

  @override
  Future<Either<String, String>> toggleFavorite(int productId) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.addToFavorite,
        data: {'product_id': productId},
        isFormData: true,
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
