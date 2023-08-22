part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);

  @override
  List<Object?> get props => [themeMode];

  @override
  String toString() => 'ThemeState(currentTheme: $themeMode)';

  ThemeState copyWith({
    ThemeMode? theme,
  }) {
    return ThemeState(
      theme ?? themeMode,
    );
  }
}
