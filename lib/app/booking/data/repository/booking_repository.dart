import 'package:booking_app/app/booking/data/data_sources/remote_data_source.dart';
import 'package:booking_app/app/booking/domain/base_repository/booking_base_repository.dart';
import 'package:booking_app/app/booking/domain/entity/get_booking.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:dartz/dartz.dart';
import 'package:booking_app/app/booking/domain/entity/create_booking.dart';

class BookingRepository extends BookingBaseRepository {
  final BookingBaseRemoteDataSource bookingBaseRemoteDataSource;

  BookingRepository({required this.bookingBaseRemoteDataSource});

  @override
  Future<Either<dynamic, CreateBooking>> createBooking(
      {required int hotelId}) async {
    try {
      var response = await bookingBaseRemoteDataSource.createBooking(
          hotelId: hotelId, token: token);
      return Right(response);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<dynamic, List<GetBooking>>> getBooking(
      {required String type}) async {
    try {
      var response = await bookingBaseRemoteDataSource.getBooking(
          type: type, token: token);
      return Right(response);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
