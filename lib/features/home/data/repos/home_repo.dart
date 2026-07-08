import 'package:dartz/dartz.dart';
import 'package:shop/features/home/data/models/best_seller_model.dart';
import 'package:shop/features/home/data/models/categories_model.dart';
import 'package:shop/features/home/data/models/products_model.dart';
import 'package:shop/features/home/data/models/sliders_model.dart';

abstract class HomeRepo {
    Future<Either<String,List<Categories>>> fetchCategories();
    Future<Either<String,List<Sliders>>> fetchSliders();
    Future<Either<String, List<BestSellerProducts>>> fetchBestSeller();
    Future<Either<String, List<Products>>> searchProducts(String query);
}