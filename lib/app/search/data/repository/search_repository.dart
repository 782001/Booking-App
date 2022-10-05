
import 'package:booking_app/app/search/domain/usecase/get_search_usecase.dart';
import 'package:dartz/dartz.dart';

import 'package:booking_app/app/search/domain/entities/search.dart';

import '../../../../core/errors/network_exception.dart';
import '../../domain/base_repository/search_base_repository.dart';
import '../data_source/search_remote_data_source.dart';

class SearchRepository extends SearchBaseRepository {
  final SearchBaseRemoteDataSource baseSearchRepository;

  SearchRepository(this.baseSearchRepository);

  @override
  Future<Either<dynamic, Data>> getSearch(
      {required SearchParameters parameters}) async {
    try {
      var response = await baseSearchRepository.getSearchDataSource(
        searchParameters: parameters,
      );
      
      return Right(response);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

}
