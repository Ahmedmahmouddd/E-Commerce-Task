import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
 Future<Either<String, List<ProductEntity>>> searchProducts(String name);
}