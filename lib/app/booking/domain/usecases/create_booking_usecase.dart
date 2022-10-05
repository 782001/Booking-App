import 'package:booking_app/app/booking/domain/base_repository/booking_base_repository.dart';
import 'package:booking_app/app/booking/domain/entity/create_booking.dart';
import 'package:booking_app/core/base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CreateBookingUseCase extends BaseUseCase<CreateBooking, int> {
  final BookingBaseRepository bookingBaseRepository;

  CreateBookingUseCase({required this.bookingBaseRepository});

  @override
  Future<Either<dynamic, CreateBooking>> call(int parameters) async {
    return bookingBaseRepository.createBooking(hotelId: parameters);
  }
}
