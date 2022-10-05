import 'package:booking_app/app/explore/domain/entities/hotel_data.dart';
import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final List<HotelDataEntities> hotelData;
  final int lastPage;
  final int total;

  const Data({
    required this.hotelData,
    required this.total,
    required this.lastPage,
  });

  @override
  List<Object?> get props {
    return [
      hotelData,
      lastPage,
      total,
    ];
  }
}
