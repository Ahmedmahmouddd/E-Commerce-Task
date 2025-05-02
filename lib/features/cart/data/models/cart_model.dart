import '../../domain/entities/cart_entity.dart';

class CartProductModel {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedPrice;
  final String thumbnail;

  CartProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
    required this.thumbnail,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      total: (json['total'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      thumbnail: json['thumbnail'],
    );
  }

  CartProductEntity toEntity() {
    return CartProductEntity(
      id: id,
      title: title,
      price: price,
      quantity: quantity,
      total: total,
      discountPercentage: discountPercentage,
      discountedPrice: discountedPrice,
      thumbnail: thumbnail,
    );
  }
}
