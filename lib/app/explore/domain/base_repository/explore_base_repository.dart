import 'package:booking_app/app/explore/domain/use_cases/get_hotels_usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/hotel.dart';

abstract class ExploreBaseRepository {
  Future<Either<dynamic, Data>> getHotels(
      {required HotelParameters parameters});
}
