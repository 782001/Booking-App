import 'package:booking_app/app/search/data/model/model.dart';

import '../../../../core/network/api_constance.dart';
import '../../domain/usecase/get_search_usecase.dart';

abstract class SearchBaseRemoteDataSource {
  SearchBaseRemoteDataSource();
  Future<DataModel> getSearchDataSource({
    required SearchParameters searchParameters,
  });
}

class SearchRemoteDataSource extends SearchBaseRemoteDataSource {
  SearchRemoteDataSource();

  @override
  Future<DataModel> getSearchDataSource({
    required SearchParameters searchParameters,
  }) async {
    Map<String, dynamic>? query;
    if (searchParameters.facilities != null) {
      query = {
        'name': searchParameters.name,
        'min_price': searchParameters.minPrice,
        'max_price': searchParameters.maxPrice,
        ...searchParameters.facilities!,
        'latitude': searchParameters.lantitude,
        'longitude': searchParameters.langtitude,
        'count': searchParameters.page,
        'page': searchParameters.page,
      };
    }

    var response2 = await dio.get(
      ApiConstance.searchEndPoint,
      queryParameters: query ??
          {
            'address': searchParameters.name,
            'min_price': searchParameters.minPrice,
            'max_price': searchParameters.maxPrice,
            'latitude': searchParameters.lantitude,
            'longitude': searchParameters.langtitude,
            'count': searchParameters.count,
            'page': searchParameters.page,
          },
    );
    var response1 = await dio.get(
      ApiConstance.searchEndPoint,
      queryParameters: query ??
          {
            'name': searchParameters.name,
            'min_price': searchParameters.minPrice,
            'max_price': searchParameters.maxPrice,
            'latitude': searchParameters.lantitude,
            'longitude': searchParameters.langtitude,
            'count': searchParameters.count,
            'page': searchParameters.page,
          },
    );

    if ((response1.data['data']['data'] as List).length >
        (response2.data['data']['data'] as List).length) {
      if (response1.data['status']['type'] == '1' &&
          response1.statusCode == 200) {
        print('*********************${response1.data}');
        print('*********************${response2.data}');

        return DataModel.fromJson(response1.data);
      } else {
        print('*********************${response2.data}');
        throw Exception();
      }
    } else {
      print('*********************${response2.data}');
      if (response2.data['status']['type'] == '1' &&
          response2.statusCode == 200) {
        print('*********************${response2.data}');
        return DataModel.fromJson(response2.data);
      } else {
        throw Exception();
      }
    }
  }
}
