import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/domain/repository/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());

  final SearchRepository searchRepository;

  Future<void> searchProducts(String name) async {
    emit(SearchLoading());
    final result = await searchRepository.searchProducts(name);
    result.fold(
      (failure) => emit(SearchFailure(failure)),
      (productList) => emit(SearchSuccess(productList)),
    );
  }
}
