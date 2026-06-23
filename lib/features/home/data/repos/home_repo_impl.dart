import 'package:dartz/dartz.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/network/api_response.dart';
import 'package:shop/core/network/end_points.dart';
import 'package:shop/features/home/data/models/categories_model.dart';
import 'package:shop/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper;

  HomeRepoImpl({required this.apiHelper});
  @override
  Future<Either<String, List<Categories>>> fetchCategories() async{
    try {
      var result = await apiHelper.getRequest(endPoint: EndPoints.categories);
    if(result.status){
      return right(result.data.map((e) => Categories.fromJson(e)).toList());
    }else{
      return left(result.message);
    }
    } catch (e) {
      return left(ApiResponse.fromError(e).toString());
    }
  }
}
