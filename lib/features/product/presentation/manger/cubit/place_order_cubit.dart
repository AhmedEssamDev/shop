import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/product/data/models/cart_item_model.dart';
import 'package:shop/features/product/data/models/place_order_model.dart';
import 'package:shop/features/product/data/repo/place_order_repo.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit(this.placeOrderRepo) : super(PlaceOrderInitial());
  static PlaceOrderCubit get(BuildContext context) => BlocProvider.of(context);
  final PlaceOrderRepo placeOrderRepo;
  Future<void> placeOrder({
    required List<CartItemModel> items,
  }) async {
    emit(PlaceOrderLoading());
    var result = await placeOrderRepo.placeOrder(items: items);
    result.fold(
      (l) => emit(PlaceOrderFailure(l)),
      (r) => emit(PlaceOrderSuccess(r)),
    );
  }

}
