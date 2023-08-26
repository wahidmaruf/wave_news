import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.light));

  void changeTheme() {
    if (state.themeMode == ThemeMode.light) {
      emit(state.copyWith(theme: ThemeMode.dark));
    } else {
      emit(state.copyWith(theme: ThemeMode.light));
    }
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState(ThemeMode.values[json['theme'] as int]);
  }

  @override
  Map<String, int>? toJson(ThemeState state) {
    return {'theme': state.themeMode.index};
  }
}
