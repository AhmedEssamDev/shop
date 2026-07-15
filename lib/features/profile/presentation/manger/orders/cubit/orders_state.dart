part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class OrdersLoading extends OrdersState {}
final class OrdersSuccess extends OrdersState {
  final OrdersData ordersData;
  OrdersSuccess(this.ordersData);
}
final class OrdersFailure extends OrdersState {
  final String errMessage;
  OrdersFailure(this.errMessage);
}



