abstract class AppState {}

class InitialAppState extends AppState {}

class BottomNavScreens extends AppState {}

class NewsBusinessLoadingState extends AppState {}

class NewsBusinessStateSuccess extends AppState {}

class NewsBusinessStateError extends AppState {
  final String error;
  NewsBusinessStateError({this.error});
}

class NewsSportLoadingState extends AppState {}

class NewsSportStateSuccess extends AppState {}

class NewsSportStateError extends AppState {
  final String error;
  NewsSportStateError({this.error});
}

class NewsScienceLoadingState extends AppState {}

class NewsScienceStateSuccess extends AppState {}

class NewsScienceStateError extends AppState {
  final String error;
  NewsScienceStateError({this.error});
}
