import 'package:booking_app/app/auth/domain/entities/auth_entity.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/register_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/update_profile_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class AuthBaseRepository {
  Future<Either<dynamic, Auth>> login({required LoginParameters parameters});
  Future<Either<dynamic, Auth>> register(
      {required RegisterParameters registerParameters});
  Future<Either<dynamic, Auth>> profileInfo({String? token});
  Future<Either<dynamic, Auth>> updateProfile(
      {required UpdateProfileParameters parameters});
}
