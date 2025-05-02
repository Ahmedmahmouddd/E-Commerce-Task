import 'package:ahmed_mahmoud_flutter_task/features/home/data/model/dimention_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/data/model/meta_mode.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/data/model/review_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/dimention_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/meta_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';

class ProductsResponseModel {
  final List<ProductModel>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductsResponseModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductsResponseModel(
      products: json['products'] != null
          ? (json['products'] as List<dynamic>)
              .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }
}


class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final double? weight;
  final DimensionsModel? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<ReviewModel>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final MetaModel? meta;
  final String? thumbnail;
  final List<String>? images;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.thumbnail,
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: json['stock'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      brand: json['brand'],
      sku: json['sku'],
      weight: (json['weight'] as num?)?.toDouble(),
      dimensions: json['dimensions'] != null
          ? DimensionsModel.fromJson(json['dimensions'])
          : null,
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
              .map((e) => ReviewModel.fromJson(e))
              .toList()
          : null,
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: json['meta'] != null ? MetaModel.fromJson(json['meta']) : null,
      thumbnail: json['thumbnail'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      category: category ?? '',
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      tags: tags ?? [],
      brand: brand ?? '',
      sku: sku ?? '',
      weight: weight ?? 0.0,
      dimensions: dimensions?.toEntity() ?? DimensionsEntity(width: 0.0, height: 0.0, depth: 0.0),
      warrantyInformation: warrantyInformation ?? '',
      shippingInformation: shippingInformation ?? '',
      availabilityStatus: availabilityStatus ?? '',
      reviews: reviews?.map((e) => e.toEntity()).toList() ?? [],
      returnPolicy: returnPolicy ?? '',
      minimumOrderQuantity: minimumOrderQuantity ?? 0,
      meta: meta?.toEntity() ?? MetaEntity(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        barcode: '',
        qrCode: '',
      ),
      thumbnail: thumbnail ?? '',
      images: images ?? [],
    );
  }
}
