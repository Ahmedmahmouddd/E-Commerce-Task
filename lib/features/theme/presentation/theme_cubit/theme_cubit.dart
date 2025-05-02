import 'package:ahmed_mahmoud_flutter_task/features/theme/presentation/widgets/theme_state_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Future<void> changeTheme(ThemeStateEnum state) async {
    final prefs = await SharedPreferences.getInstance();

    switch (state) {
      case ThemeStateEnum.initial:
        final savedTheme = prefs.getString('theme');

        if (savedTheme == 'dark') {
          emit(ThemeDark());
        } else if (savedTheme == 'light') {
          emit(ThemeLight());
        } else {
          emit(ThemeInitial());
        }
        break;

      case ThemeStateEnum.dark:
        await prefs.setString('theme', 'dark');
        emit(ThemeDark());
        break;

      case ThemeStateEnum.light:
        await prefs.setString('theme', 'light');
        emit(ThemeLight());
        break;
    }
  }
}
