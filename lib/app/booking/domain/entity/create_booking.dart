import 'package:equatable/equatable.dart';

class CreateBooking extends Equatable {
  final String type;
  final String messageAr;
  final String messageEn;
  final int bookingId;

  const CreateBooking(
      {required this.type,
      required this.messageAr,
      required this.messageEn,
      required this.bookingId});

  @override
  List<Object> get props => [type, messageAr, messageEn, bookingId];
}
