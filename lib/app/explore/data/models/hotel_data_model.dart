import '../../domain/entities/hotel_data.dart';

class HotelDataModel extends HotelDataEntities {
  const HotelDataModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.rate,
    required super.images,
    required super.updated_at,
    required super.created_at,
  });

  factory HotelDataModel.fromJson(Map<String, dynamic> json) {
    return HotelDataModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      rate: json['rate'],
      images: List<String>.from(
          (json['hotel_images'] as List).map((x) => x['image'])),
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
