import 'package:dartz/dartz.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/network/api_response.dart';
import 'package:shop/core/network/end_points.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';
import 'package:shop/features/profile/data/repo/orders/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final ApiHelper apiHelper;

  OrdersRepoImpl(this.apiHelper);

  @override
  Future<Either<String, OrderResponseModel>> getOrders()async {
    try {
      var response = await apiHelper.getRequest(endPoint: EndPoints.orders);
      if(response.status){
        var orders = OrderResponseModel.fromJson(response.data);
        return right(orders);
      }else{
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).toString());
    }
  }

  @override
  Future<Either<String, String>> cancelOrder(int orderId) async {
    try {
      var response = await apiHelper.postRequest(
          endPoint: '${EndPoints.cancelOrder}$orderId');
      if (response.status) {
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).toString());
    }
  }

  @override
  Future<Either<String, String>> completeOrder(int orderId) async {
    try {
      var response = await apiHelper.postRequest(
          endPoint: '${EndPoints.completeOrder}$orderId');
      if (response.status) {
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).toString());
    }
  }
}