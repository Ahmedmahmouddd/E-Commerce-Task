import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.productRepository) : super(HomeInitial());

  final ProductRepository productRepository;

  List<ProductEntity> products = [];
  Future<void> getProducts() async {
    emit(HomeLoading());
    final result = await productRepository.getProducts();
    result.fold((failure) => emit(HomeFailure(failure)), (productList) {
      products = productList;
      emit(HomeSuccess(productList));
    });
  }

  int selectedFilter = 0;

  Future<void> getSortedProducts(String sort) async {
    emit(SortedProductsLoading());
    final result = await productRepository.getSortedProducts(sort);
    result.fold(
      (failure) => emit(SortedProductsFailure(failure)),
      (productList) => emit(SortedProductsSuccess(productList)),
    );
  }
}
