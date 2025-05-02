part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductEntity> products;
  HomeSuccess(this.products);
}

final class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}

final class SortedProductsLoading extends HomeState {}

final class SortedProductsSuccess extends HomeState {
  final List<ProductEntity> products;
  SortedProductsSuccess(this.products);
}

final class SortedProductsFailure extends HomeState {
  final String message;
  SortedProductsFailure(this.message);
}
