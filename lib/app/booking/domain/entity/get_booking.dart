import 'package:equatable/equatable.dart';

class GetBooking extends Equatable {
  final int bookingId;
  final int hotelId;
  final String hotelName;
  final String hotelDescription;
  final String hotelPrice;
  final String hotelAddress;
  final String hotelLongitude;
  final String hotelLatitude;
  final String hotelRate;
  final List<HotelImages> hotelImages;
  final List<HotelFacilities> facilities;
  const GetBooking({
    required this.bookingId,
    required this.hotelId,
    required this.hotelName,
    required this.hotelDescription,
    required this.hotelPrice,
    required this.hotelAddress,
    required this.hotelLongitude,
    required this.hotelLatitude,
    required this.hotelRate,
    required this.hotelImages,
    required this.facilities,
  });

  @override
  List<Object> get props {
    return [
      bookingId,
      hotelId,
      hotelName,
      hotelDescription,
      hotelPrice,
      hotelAddress,
      hotelLongitude,
      hotelLatitude,
      hotelRate,
      hotelImages,
      facilities,
    ];
  }
}

class HotelImages extends Equatable {
  final int id;

  final String image;

  const HotelImages({required this.id, required this.image});

  @override
  List<Object> get props => [id, image];
}

class HotelFacilities extends Equatable {
  final int id;
  final String name;
  final String image;

  const HotelFacilities(
      {required this.id, required this.name, required this.image});

  @override
  List<Object> get props => [id, name, image];
}
