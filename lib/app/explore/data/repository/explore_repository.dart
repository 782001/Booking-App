import 'package:booking_app/app/explore/data/data_source/explore_remote_data_source.dart';
import 'package:booking_app/app/explore/domain/base_repository/explore_base_repository.dart';
import 'package:booking_app/app/explore/domain/use_cases/get_hotels_usecase.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/hotel.dart';

class ExploreRepository extends ExploreBaseRepository {
  final ExploreBaseRemoteDataSource baseRemoteDataSource;

  ExploreRepository(this.baseRemoteDataSource);
  @override
  Future<Either<dynamic, Data>> getHotels(
      {required HotelParameters parameters}) async {
    try {
      var response = await baseRemoteDataSource.getHotelDataSource(
          hotelParameters: parameters);
      return Right(response);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
