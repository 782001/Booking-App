import 'package:booking_app/app/search/domain/entities/search.dart';

class DataModel extends Data {
  DataModel({
    required super.search,
    required super.lastPage,
    required super.total,
    required super.currentPage,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      search: List<SearchModel>.from(
        json['data']['data'].map(
          (x) => SearchModel.fromJson(x),
        ),
      ),
      lastPage: json['data']['last_page'],
      total: json['data']['total'],
      currentPage: json['data']['current_page']
    );
  }
}

class SearchModel extends Search {
  const SearchModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.address,
    required super.longitude,
    required super.latitude,
    required super.rate,
    required super.hotelImages,
    required super.facilities,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      rate: json['rate'],
      hotelImages: (json['hotel_images'] as List).map((element) {
        return HotelImageModel.formJson(element);
      }).toList(),
      facilities: (json['facilities'] as List).map((element) {
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
