class PlaceOrderModel {
  String? message;
  int? orderId;
  bool? status;
  num? total;

  PlaceOrderModel({this.message, this.orderId, this.status, this.total});

  PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    orderId = json['order_id'];
    status = json['status'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['order_id'] = orderId;
    data['status'] = status;
    data['total'] = total;
    return data;
  }
}
