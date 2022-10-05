import 'package:booking_app/app/search/domain/entities/search.dart';
import 'package:booking_app/app/search/domain/usecase/get_search_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class SearchBaseRepository {
  Future<Either<dynamic, Data>> getSearch({
    required SearchParameters parameters,
  });


}
