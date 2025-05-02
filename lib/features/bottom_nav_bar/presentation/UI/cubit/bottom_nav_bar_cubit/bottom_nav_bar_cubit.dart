import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  int pageIndex = 0;

  changeIndex(int index) {
    pageIndex = index;
    emit(BottomNavBarInitial());
  }
}
