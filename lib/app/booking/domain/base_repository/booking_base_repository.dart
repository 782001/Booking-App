import 'package:booking_app/app/booking/domain/entity/create_booking.dart';
import 'package:booking_app/app/booking/domain/entity/get_booking.dart';
import 'package:dartz/dartz.dart';

abstract class BookingBaseRepository {
  Future<Either<dynamic, CreateBooking>> createBooking({required int hotelId});
  Future<Either<dynamic, List<GetBooking>>> getBooking({required String type});
}
