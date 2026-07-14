import 'package:dartz/dartz.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/network/api_response.dart';
import 'package:shop/core/network/end_points.dart';
import 'package:shop/features/product/data/models/cart_item_model.dart';
import 'package:shop/features/product/data/models/place_order_model.dart';
import 'package:shop/features/product/data/repo/place_order_repo.dart';

class PlaceOrderRepoImpl implements PlaceOrderRepo {
  final ApiHelper apiHelper;

  PlaceOrderRepoImpl(this.apiHelper);
  @override
  Future<Either<String, PlaceOrderModel>> placeOrder({
    required List<CartItemModel> items,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.placeOrder,
        data: {'items': items.map((e) => e.toJson()).toList()},
        isFormData: false,
      );
      if (response.status) {
        var orders = PlaceOrderModel.fromJson(response.data);
        return Right(orders);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
