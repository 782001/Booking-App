import 'package:booking_app/app/booking/data/model/create_booking_model.dart';
import 'package:booking_app/app/booking/data/model/get_booking_model.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/network/status.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class BookingBaseRemoteDataSource {
  Future<CreateBookingModel> createBooking({
    String? base,
    String? endPoint,
    dynamic data,
    required int hotelId,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
  Future<List<GetBookingModel>> getBooking({
    String? base,
    String? endPoint,
    dynamic data,
    required String type,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class BookingRemoteDataSource extends BookingBaseRemoteDataSource {
  @override
  Future<CreateBookingModel> createBooking(
      {String? base,
      String? endPoint,
      data,
      required int hotelId,
      String? token,
      ProgressCallback? progressCallback,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    FormData? formData;
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };
    debugPrint(
        'URL => ${dio.options.baseUrl + ApiConstance.createBookingEndPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');

    formData = FormData.fromMap({
      'hotel_id': hotelId,
    });

    var response =
        await dio.post(ApiConstance.createBookingEndPoint, data: formData);

    if (response.statusCode == 200 && response.data["status"]["type"] == '1') {
      return CreateBookingModel.fromJson(response.data['status']);
    } else if (response.statusCode == 200 &&
        response.data['status']['type'] == '0') {
      statusModel = StatusModel.fromJson(response.data['status']);
      throw Exception();
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<GetBookingModel>> getBooking({
    String? base,
    String? endPoint,
    data,
    required String type,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };
    debugPrint(
        'URL => ${dio.options.baseUrl + ApiConstance.getBookingEndPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');

    var response = await dio
        .get(ApiConstance.getBookingEndPoint, queryParameters: {'type': type});

    if (response.statusCode == 200 && response.data["status"]["type"] == '1') {
      return List<GetBookingModel>.from((response.data['data']['data'] as List)
          .map((e) => GetBookingModel.fromJson(e))).toList();
    } else if (response.statusCode == 200 &&
        response.data["status"]["type"] == '0') {
      return [];
    } else {
      throw Exception();
    }
  }
}
