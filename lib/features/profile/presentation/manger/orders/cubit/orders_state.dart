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

final class OrderActionLoading extends OrdersState {}
final class OrderActionSuccess extends OrdersState {
  final String message;
  OrderActionSuccess(this.message);
}
final class OrderActionFailure extends OrdersState {
  final String errMessage;
  OrderActionFailure(this.errMessage);
}



