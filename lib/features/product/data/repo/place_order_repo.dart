import 'package:dartz/dartz.dart';
import 'package:shop/features/product/data/models/cart_item_model.dart';
import 'package:shop/features/product/data/models/place_order_model.dart';

abstract class PlaceOrderRepo {
  Future<Either<String,PlaceOrderModel>> placeOrder(
    {
      required List<CartItemModel> items,
    }
  );
}
