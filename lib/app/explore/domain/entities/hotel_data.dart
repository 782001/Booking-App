import 'package:equatable/equatable.dart';

class HotelDataEntities extends Equatable {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String latitude;
  final String longitude;
  final String rate;
  final String created_at;
  final String updated_at;
  final List<String> images;

  const HotelDataEntities({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.rate,
    required this.images,
    required this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props {
    return [
      name,
      price,
      address,
      latitude,
      longitude,
      description,
      id,
      images,
      rate,
      updated_at,
      created_at
    ];
  }
}
