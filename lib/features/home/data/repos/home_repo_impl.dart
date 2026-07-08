import 'package:dartz/dartz.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/network/api_response.dart';
import 'package:shop/core/network/end_points.dart';
import 'package:shop/features/home/data/models/best_seller_model.dart';
import 'package:shop/features/home/data/models/categories_model.dart';
import 'package:shop/features/home/data/models/products_model.dart';
import 'package:shop/features/home/data/models/sliders_model.dart';
import 'package:shop/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper;

  HomeRepoImpl(this.apiHelper);
  @override
  Future<Either<String, List<Categories>>> fetchCategories() async{
    try {
      var result = await apiHelper.getRequest(endPoint: EndPoints.categories);
    if(result.status){
      var categoriesResponse = CategoriesModel.fromJson(result.data);
      return right(categoriesResponse.categories ?? []);
    }else{
      return left(result.message);
    }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  @override
  Future<Either<String, List<Sliders>>> fetchSliders() async{
   
    try {
      var result = await apiHelper.getRequest(endPoint: EndPoints.sliders);
    if(result.status){
      var slidersResponse = SlidersModel.fromJson(result.data);
      return right(slidersResponse.sliders ?? []);
    }else{
      return left(result.message);
    }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  @override
  Future<Either<String, List<BestSellerProducts>>> fetchBestSeller() async{
    try {
      var result = await apiHelper.getRequest(endPoint: EndPoints.bestSeller);
    if(result.status){
      var bestSellerResponse = BestSellerModel.fromJson(result.data);
      return right(bestSellerResponse.bestSellerProducts ?? []);
    }else{
      return left(result.message);
    }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  @override
  Future<Either<String, List<Products>>> searchProducts(String query) async{
    try {
      var result = await apiHelper.getRequest(endPoint: EndPoints.search + query);
    if(result.status){
      var productsResponse = ProductsModel.fromJson(result.data);
      return right(productsResponse.products ?? []);
    }else{
      return left(result.message);
    }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }
}
