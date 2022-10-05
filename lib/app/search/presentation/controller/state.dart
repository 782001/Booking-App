abstract class SearchState {}

class InitialSearchState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {}
class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({required this.message});
}

class SearchPaginationLoadingState extends SearchState {}
class SearchPaginationLoadedState extends SearchState {}

class SearchPaginationErrorState extends SearchState {
  final String message;

  SearchPaginationErrorState({required this.message});
}




class ToggleIsEndState extends SearchState {}