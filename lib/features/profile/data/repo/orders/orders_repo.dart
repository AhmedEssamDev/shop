import 'package:dartz/dartz.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';

abstract class OrdersRepo {
    Future<Either<String,OrderResponseModel>> getOrders();
    Future<Either<String,String>> cancelOrder(int orderId);
    Future<Either<String,String>> completeOrder(int orderId);
}


