import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';

class OrderModel {
  final int id;
  final List<ProductModel> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  static const String idKey = 'id';
  static const String productsKey = 'products';
  static const String totalKey = 'total';
  static const String discountedTotalKey = 'discountedTotal';
  static const String userIdKey = 'userId';
  static const String totalProductsKey = 'totalProducts';
  static const String totalQuantityKey = 'totalQuantity';

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
      id: json[idKey],
      products:
          (json[productsKey] as List)
              .map((p) => ProductModel.fromJson(p))
              .toList(),
      total: (json[totalKey] as num).toDouble(),
      discountedTotal: (json[discountedTotalKey] as num).toDouble(),
      userId: json[userIdKey],
      totalProducts: json[totalProductsKey],
      totalQuantity: json[totalQuantityKey],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      idKey: id,
      productsKey: products.map((p) => p.toJson()).toList(),
      totalKey: total,
      discountedTotalKey: discountedTotal,
      userIdKey: userId,
      totalProductsKey: totalProducts,
      totalQuantityKey: totalQuantity,
    };
  }
}

class ProductModel {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double? discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  static const String idKey = 'id';
  static const String titleKey = 'title';
  static const String priceKey = 'price';
  static const String quantityKey = 'quantity';
  static const String totalKey = 'total';
  static const String discountPercentageKey = 'discountPercentage';
  static const String discountedTotalKey = 'discountedTotal';
  static const String thumbnailKey = 'thumbnail';

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[idKey],
      title: json[titleKey],
      price: (json[priceKey] as num).toDouble(),
      quantity: json[quantityKey],
      total: (json[totalKey] as num).toDouble(),
      discountPercentage: (json[discountPercentageKey] as num?)?.toDouble(),
      discountedTotal:
          json[discountedTotalKey] != null
              ? (json[discountedTotalKey] as num).toDouble()
              : 0.0,
      thumbnail: json[thumbnailKey],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      idKey: id,
      titleKey: title,
      priceKey: price,
      quantityKey: quantity,
      totalKey: total,
      discountPercentageKey: discountPercentage,
      discountedTotalKey: discountedTotal,
      thumbnailKey: thumbnail,
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
      discountPercentage: discountPercentage ?? 0.0,
      discountedTotal: discountedTotal,
      thumbnail: thumbnail,
    );
  }
}
