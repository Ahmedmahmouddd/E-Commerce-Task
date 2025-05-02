import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';

class OrderModel {
  final int id;
  final List<ProductModel> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  OrderModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      products:
          (json['products'] as List)
              .map((p) => ProductModel.fromJson(p))
              .toList(),
      total: (json['total'] as num).toDouble(),
      discountedTotal: (json['discountedTotal'] as num).toDouble(),
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((p) => p.toJson()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }
}

class ProductModel {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      total: (json['total'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      discountedTotal: (json['discountedTotal'] as num).toDouble(),
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedTotal': discountedTotal,
      'thumbnail': thumbnail,
    };
  }
}

extension OrderModelMapper on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      products: products.map((p) => p.toEntity()).toList(),
      total: total,
      discountedTotal: discountedTotal,
      userId: userId,
      totalProducts: totalProducts,
      totalQuantity: totalQuantity,
    );
  }
}

extension ProductModelMapper on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      quantity: quantity,
      total: total,
      discountPercentage: discountPercentage,
      discountedTotal: discountedTotal,
      thumbnail: thumbnail,
    );
  }
}
