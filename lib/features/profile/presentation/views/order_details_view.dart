import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';
import 'package:shop/features/profile/presentation/views/widgets/order_details_view_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
    required this.order,
    required this.status,
  });

  final Order order;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: OrderDetailsViewBody(order: order, status: status),
    );
  }
}
