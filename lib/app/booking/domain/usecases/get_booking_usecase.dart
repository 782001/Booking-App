import 'package:booking_app/app/booking/domain/base_repository/booking_base_repository.dart';
import 'package:booking_app/app/booking/domain/entity/get_booking.dart';
import 'package:booking_app/core/base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetBookingUseCase extends BaseUseCase<List<GetBooking>, String> {
  final BookingBaseRepository bookingBaseRepository;

  GetBookingUseCase({required this.bookingBaseRepository});

  @override
  Future<Either<dynamic, List<GetBooking>>> call(String parameters) async {
    return await bookingBaseRepository.getBooking(type: parameters);
  }
}
