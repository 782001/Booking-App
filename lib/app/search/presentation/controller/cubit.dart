import 'package:booking_app/app/search/domain/entities/search.dart';
import 'package:booking_app/app/search/domain/usecase/get_search_usecase.dart';
import 'package:booking_app/app/search/presentation/controller/state.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetSearchUseCase getSearchUseCase;
  SearchCubit({required this.getSearchUseCase}) : super(InitialSearchState());
  static SearchCubit get(context) => BlocProvider.of(context);
  List<Search> listSearch = [];

  RangeValues values = const RangeValues(1250, 3500);

  int lastPage = 1;
  int total = 0;
  int currentPage = 1;
  List<int> facilities = [];

  void getSearch({
    String? name,
    double? minPrice,
    double? maxPrice,
    List<int> facilities = const [],
  }) async {
    emit(SearchLoadingState());
    var response = await getSearchUseCase(
      SearchParameters(
        name: name,
        minPrice: minPrice,
        maxPrice: maxPrice,
        facilities: {
          ...facilities.asMap().map(
                (key, value) => MapEntry(
                  'facilities[$key]',
                  value,
                ),
              ),
        },
      ),
    );
    print('//////////////$response');
    response.fold((l) {
      emit(SearchErrorState(message: NetworkExceptions.getErrorMessage(l)));
    }, (r) {
      listSearch = r.search;
     
      emit(SearchLoadedState());
    });
  }

    void getSearchPagination({
    bool isForce = false,
    int? page ,
    
  }) async {
    emit(SearchPaginationLoadingState());
    if (isForce) {
      listSearch = [];
      currentPage = 1;
    }
    var response = await getSearchUseCase(
      SearchParameters(
        count: 4,
        page: currentPage,
       
      
      ),
    );
    print('//////////////$response');
    response.fold((l) {
      emit(SearchPaginationErrorState(message: NetworkExceptions.getErrorMessage(l)));
    }, (r) {
      listSearch.addAll(r.search);
      currentPage++;
      if (lastPage == 1) {
        lastPage = r.lastPage;
        total = r.total;
      }
      isEnd = false;
      emit(SearchPaginationLoadedState());
    });
  }

  bool isEnd = false;

  void toggleIsEnd() {
    isEnd = !isEnd;
    emit(SearchPaginationLoadedState());
  }
}
