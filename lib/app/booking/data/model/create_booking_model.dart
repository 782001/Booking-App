import 'package:booking_app/app/booking/domain/entity/create_booking.dart';

class CreateBookingModel extends CreateBooking {
  const CreateBookingModel(
      {required super.type,
      required super.messageAr,
      required super.messageEn,
      required super.bookingId});
  factory CreateBookingModel.fromJson(Map<String, dynamic> json) {
    return CreateBookingModel(
      type: json['type'] ?? '0',
      messageAr:
          json['title'] != null ? json['title']['ar'] ?? 'empty' : 'empty',
      messageEn:
          json['title'] != null ? json['title']['en'] ?? 'empty' : 'empty',
      bookingId: json['booking_id'] ?? 0,
    );
  }
}
