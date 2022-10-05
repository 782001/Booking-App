import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Data extends Equatable {
  List<Search> search;
  final int lastPage;
  final int total;
  final int currentPage;
  Data({
    required this.search,
    required this.lastPage,
    required this.total,
    required this.currentPage,
  });

  @override
  List<Object?> get props => [
        search,
        lastPage,
        total,
        currentPage,
      ];
}

class Search extends Equatable {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String longitude;
  final String latitude;
  final String rate;
  final List<HotelImages> hotelImages;
  final List<HotelFacilities> facilities;

  const Search({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.hotelImages,
    required this.facilities,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        address,
        latitude,
        longitude,
        rate,
        hotelImages,
        facilities
      ];
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
