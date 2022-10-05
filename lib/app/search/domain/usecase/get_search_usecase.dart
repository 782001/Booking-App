import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:booking_app/app/search/domain/entities/search.dart';

import '../../../../core/base_usecase/base_usecase.dart';
import '../base_repository/search_base_repository.dart';

class GetSearchUseCase extends BaseUseCase<Data, SearchParameters> {
  final SearchBaseRepository baseSearchRepository;

  GetSearchUseCase({
    required this.baseSearchRepository,
  });

  @override
  Future<Either<dynamic, Data>> call(
      SearchParameters parameters) async {
    return await baseSearchRepository.getSearch(parameters: parameters);
  }
}

class SearchParameters extends Equatable {
  final String? name;
  final String? address;
  final double? minPrice;
  final double? maxPrice;
  final RangeValues? values;
  final Map<String, int>? facilities;
  final String? langtitude;
  final String? lantitude;
  final int? page;
  final int? count;

  const SearchParameters({
    this.name,
    this.address,
    this.values,
    this.maxPrice,
    this.minPrice,
    this.facilities,
    this.lantitude,
    this.langtitude,
    this.page,
    this.count,
  });

  @override
  List<Object?> get props {
    return [
      name,
      address,
      minPrice,
      maxPrice,
      values,
      facilities,
      langtitude,
      lantitude,
      page,
      count
    ];
  }
}
