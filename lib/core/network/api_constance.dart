import 'package:booking_app/app/search/domain/usecase/get_search_usecase.dart';
import 'package:booking_app/core/network/status.dart';
import 'package:dio/dio.dart';

StatusModel? statusModel;
StatusModel? registerstatusModel;
StatusProfileInfo? statusProfileInfo;
StatusModel? updateProfileStatusModel;
String? token;

class ApiConstance {
  static const String baseUrl = 'http://api.mahmoudtaha.com/api';
  static const String registerEndPoint = '/auth/register?';
  static const String loginEndPoint = '/auth/login?';
  static const String changePasswordEndPoint = '/auth/pass-change?';
  static const String getProfileInfoEndPoint = '/auth/profile-info';
  static const String updateProfileInfoEndPoint = '/auth/update-info';
  static const String getHotelsEndPoint = '/hotels?';
  static const String createBookingEndPoint = '/create-booking';
  static const String updateBookingStatusEndPoint = '/update-booking-status?';
  static const String getBookingEndPoint = '/get-bookings?';
  static const String getFacilitiesEndPoint = '/facilities';
  static const String searchEndPoint = '/search-hotels?';

  static String searchHotelPath(SearchParameters parameters) =>
      '$baseUrl/search-hotels?name=${parameters.name}';
}

final Dio dio = Dio(
  BaseOptions(
    baseUrl: ApiConstance.baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: 5000,
  ),
);
