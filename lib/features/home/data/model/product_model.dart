import 'package:ahmed_mahmoud_flutter_task/features/home/data/model/dimention_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/data/model/meta_mode.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/data/model/review_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/dimention_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/meta_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';

// Define constants for JSON keys
class JsonKeys {
  static const String products = 'products';
  static const String total = 'total';
  static const String skip = 'skip';
  static const String limit = 'limit';
  static const String id = 'id';
  static const String title = 'title';
  static const String description = 'description';
  static const String category = 'category';
  static const String price = 'price';
  static const String discountPercentage = 'discountPercentage';
  static const String rating = 'rating';
  static const String stock = 'stock';
  static const String tags = 'tags';
  static const String brand = 'brand';
  static const String sku = 'sku';
  static const String weight = 'weight';
  static const String dimensions = 'dimensions';
  static const String warrantyInformation = 'warrantyInformation';
  static const String shippingInformation = 'shippingInformation';
  static const String availabilityStatus = 'availabilityStatus';
  static const String reviews = 'reviews';
  static const String returnPolicy = 'returnPolicy';
  static const String minimumOrderQuantity = 'minimumOrderQuantity';
  static const String meta = 'meta';
  static const String thumbnail = 'thumbnail';
  static const String images = 'images';
}

class ProductsResponseModel {
  final List<ProductModel>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductsResponseModel({this.products, this.total, this.skip, this.limit});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductsResponseModel(
      products:
          json[JsonKeys.products] != null
              ? (json[JsonKeys.products] as List<dynamic>)
                  .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
                  .toList()
              : null,
      total: json[JsonKeys.total] as int?,
      skip: json[JsonKeys.skip] as int?,
      limit: json[JsonKeys.limit] as int?,
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
      id: json[JsonKeys.id],
      title: json[JsonKeys.title],
      description: json[JsonKeys.description],
      category: json[JsonKeys.category],
      price: (json[JsonKeys.price] as num?)?.toDouble(),
      discountPercentage:
          (json[JsonKeys.discountPercentage] as num?)?.toDouble(),
      rating: (json[JsonKeys.rating] as num?)?.toDouble(),
      stock: json[JsonKeys.stock],
      tags:
          json[JsonKeys.tags] != null
              ? List<String>.from(json[JsonKeys.tags])
              : null,
      brand: json[JsonKeys.brand],
      sku: json[JsonKeys.sku],
      weight: (json[JsonKeys.weight] as num?)?.toDouble(),
      dimensions:
          json[JsonKeys.dimensions] != null
              ? DimensionsModel.fromJson(json[JsonKeys.dimensions])
              : null,
      warrantyInformation: json[JsonKeys.warrantyInformation],
      shippingInformation: json[JsonKeys.shippingInformation],
      availabilityStatus: json[JsonKeys.availabilityStatus],
      reviews:
          json[JsonKeys.reviews] != null
              ? (json[JsonKeys.reviews] as List)
                  .map((e) => ReviewModel.fromJson(e))
                  .toList()
              : null,
      returnPolicy: json[JsonKeys.returnPolicy],
      minimumOrderQuantity: json[JsonKeys.minimumOrderQuantity],
      meta:
          json[JsonKeys.meta] != null
              ? MetaModel.fromJson(json[JsonKeys.meta])
              : null,
      thumbnail: json[JsonKeys.thumbnail],
      images:
          json[JsonKeys.images] != null
              ? List<String>.from(json[JsonKeys.images])
              : null,
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
      dimensions:
          dimensions?.toEntity() ??
          DimensionsEntity(width: 0.0, height: 0.0, depth: 0.0),
      warrantyInformation: warrantyInformation ?? '',
      shippingInformation: shippingInformation ?? '',
      availabilityStatus: availabilityStatus ?? '',
      reviews: reviews?.map((e) => e.toEntity()).toList() ?? [],
      returnPolicy: returnPolicy ?? '',
      minimumOrderQuantity: minimumOrderQuantity ?? 0,
      meta:
          meta?.toEntity() ??
          MetaEntity(
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
