part of 'place_order_cubit.dart';

@immutable
sealed class PlaceOrderState {}

final class PlaceOrderInitial extends PlaceOrderState {}
final class PlaceOrderLoading extends PlaceOrderState {}
final class PlaceOrderSuccess extends PlaceOrderState {
  final PlaceOrderModel placeOrder;
  PlaceOrderSuccess(this.placeOrder);
}
final class PlaceOrderFailure extends PlaceOrderState {
  final String message;
  PlaceOrderFailure(this.message);
}