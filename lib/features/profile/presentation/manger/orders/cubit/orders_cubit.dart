import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';
import 'package:shop/features/profile/data/repo/orders/orders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  static OrdersCubit get(context) => BlocProvider.of(context);
  final OrdersRepo ordersRepo;
  void getOrders() async {
    emit(OrdersLoading());
    var result = await ordersRepo.getOrders();
    result.fold((error) => emit(OrdersFailure(error)), (success) {
      if (success.orders != null) {
        emit(OrdersSuccess(success.orders!));
      } else {
        emit(OrdersFailure("لا توجد بيانات للطلبات"));
      }
    });
  }
}
