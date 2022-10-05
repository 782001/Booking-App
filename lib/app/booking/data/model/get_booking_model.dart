import 'package:booking_app/app/booking/domain/entity/get_booking.dart';

class GetBookingModel extends GetBooking {
  const GetBookingModel({
    required super.bookingId,
    required super.hotelId,
    required super.hotelName,
    required super.hotelDescription,
    required super.hotelPrice,
    required super.hotelAddress,
    required super.hotelLongitude,
    required super.hotelLatitude,
    required super.hotelRate,
    required super.hotelImages,
    required super.facilities,
  });
  factory GetBookingModel.fromJson(Map<String, dynamic> json) {
    return GetBookingModel(
      bookingId: json['id'],
      hotelId: json['hotel']['id'],
      hotelName: json['hotel']['name'],
      hotelDescription: json['hotel']['description'],
      hotelPrice: json['hotel']['price'],
      hotelAddress: json['hotel']['address'],
      hotelLongitude: json['hotel']['longitude'],
      hotelLatitude: json['hotel']['latitude'],
      hotelRate: json['hotel']['rate'],
      hotelImages: (json['hotel']['hotel_images'] as List).map((element) {
        return HotelImageModel.formJson(element);
      }).toList(),
      facilities: (json['hotel']['facilities'] as List).map((element) {
        return FacilitiesModel.formJson(element);
      }).toList(),
    );
  }
}

class HotelImageModel extends HotelImages {
  const HotelImageModel({required super.id, required super.image});
  factory HotelImageModel.formJson(Map<String, dynamic> json) {
    return HotelImageModel(id: json['id'], image: json['image']);
  }
}

class FacilitiesModel extends HotelFacilities {
  const FacilitiesModel(
      {required super.id, required super.name, required super.image});
  factory FacilitiesModel.formJson(Map<String, dynamic> json) {
    return FacilitiesModel(
        id: json['id'], name: json['name'], image: json['image']);
  }
}
