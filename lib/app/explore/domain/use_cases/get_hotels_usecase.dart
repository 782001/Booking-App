import 'package:booking_app/app/explore/domain/base_repository/explore_base_repository.dart';
import 'package:booking_app/core/base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/hotel.dart';

class GetHotelsUseCase extends BaseUseCase<Data, HotelParameters> {
  final ExploreBaseRepository baseRepository;

  GetHotelsUseCase({required this.baseRepository});

  @override
  Future<Either<dynamic, Data>> call(HotelParameters parameters) async {
    return await baseRepository.getHotels(parameters: parameters);
  }
}

class HotelParameters extends Equatable {
  final int? count;

  const HotelParameters({
    this.count,
  });

  @override
  List<Object?> get props => [
        count,
      ];
}
