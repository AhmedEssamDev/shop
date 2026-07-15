class OrderResponseModel {
  final OrdersData? orders;
  final bool? status;

  OrderResponseModel({this.orders, this.status});

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderResponseModel(
      orders: json['orders'] != null ? OrdersData.fromJson(json['orders']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders?.toJson(),
      'status': status,
    };
  }
}

class OrdersData {
  final List<Order>? active;
  final List<Order>? canceled;
  final List<Order>? completed;

  OrdersData({this.active, this.canceled, this.completed});

  factory OrdersData.fromJson(Map<String, dynamic> json) {
    return OrdersData(
      active: (json['active'] as List?)?.map((i) => Order.fromJson(i)).toList(),
      canceled: (json['canceled'] as List?)?.map((i) => Order.fromJson(i)).toList(),
      completed: (json['completed'] as List?)?.map((i) => Order.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': active?.map((i) => i.toJson()).toList(),
      'canceled': canceled?.map((i) => i.toJson()).toList(),
      'completed': completed?.map((i) => i.toJson()).toList(),
    };
  }
}

class Order {
  final Driver? driver;
  final int? id;
  final List<OrderItem>? items;
  final String? orderChangeDate;
  final String? orderDate;
  final double? shipping;
  final int? status;
  final double? subtotal;
  final double? tax;
  final double? total;

  Order({
    this.driver,
    this.id,
    this.items,
    this.orderChangeDate,
    this.orderDate,
    this.shipping,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      driver: json['driver'] != null ? Driver.fromJson(json['driver']) : null,
      id: json['id'],
      items: (json['items'] as List?)?.map((i) => OrderItem.fromJson(i)).toList(),
      orderChangeDate: json['order_change_date'],
      orderDate: json['order_date'],
      shipping: (json['shipping'] as num?)?.toDouble(),
      status: json['status'],
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driver': driver?.toJson(),
      'id': id,
      'items': items?.map((i) => i.toJson()).toList(),
      'order_change_date': orderChangeDate,
      'order_date': orderDate,
      'shipping': shipping,
      'status': status,
      'subtotal': subtotal,
      'tax': tax,
      'total': total,
    };
  }
}

class OrderItem {
  final String? description;
  final int? id;
  final String? imagePath;
  final String? name;
  final double? price;
  final int? quantity;
  final double? rating;
  final double? totalPrice;

  OrderItem({
    this.description,
    this.id,
    this.imagePath,
    this.name,
    this.price,
    this.quantity,
    this.rating,
    this.totalPrice,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      description: json['description'],
      id: json['id'],
      imagePath: json['image_path'],
      name: json['name'],
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'],
      rating: (json['rating'] as num?)?.toDouble(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'id': id,
      'image_path': imagePath,
      'name': name,
      'price': price,
      'quantity': quantity,
      'rating': rating,
      'total_price': totalPrice,
    };
  }
}

class Driver {
  final double? latitude;
  final double? longitude;
  final String? name;
  final String? phone;

  Driver({this.latitude, this.longitude, this.name, this.phone});

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
      'phone': phone,
    };
  }
}