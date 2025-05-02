import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/data/data_source/search_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl extends SearchRepository {
  SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoryImpl(this.searchRemoteDataSource);

  @override
  Future<Either<String, List<ProductEntity>>> searchProducts(String name) async {
    final result = await searchRemoteDataSource.searchProduct(name);
    return result.fold(
      (failure) => left(failure.message),
      (productList) =>
          Right(productList.products!.map((e) => e.toEntity()).toList()),
    );
  }

  
}