import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductEntity>>> getProducts();
  Future<Either<String, List<ProductEntity>>> getSortedProducts(String sort);
}
