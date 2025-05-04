import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'bottom_nav_bar_state.dart';

// BottomNavBarCubit manages the state for the bottom navigation bar, including the current selected page index.

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  // pageIndex holds the index of the current selected page.
  int pageIndex = 0;

  // changeIndex updates the pageIndex and emits a new state to trigger UI updates.
  changeIndex(int index) {
    pageIndex = index;
    emit(BottomNavBarInitial());
  }
}
