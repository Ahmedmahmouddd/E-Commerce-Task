import 'package:ahmed_mahmoud_flutter_task/features/home/data/data_source/product_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl(this.productRemoteDataSource);

  @override
  Future<Either<String, List<ProductEntity>>> getProducts() async {
    final result = await productRemoteDataSource.fetchAllProduct();
    return result.fold(
      (failure) => left(failure.message),
      (productList) =>
          Right(productList.products!.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<String, List<ProductEntity>>> getSortedProducts(
    String sort,
  ) async {
    final result = await productRemoteDataSource.fetchSortedProducts(sort);
    return result.fold(
      (failure) => left(failure.message),
      (productList) =>
          Right(productList.products!.map((e) => e.toEntity()).toList()),
    );
  }
}
