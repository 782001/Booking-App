import 'package:booking_app/app/app_cubit/states.dart';
import 'package:booking_app/app/auth/presentation/screens/profile_info_screen.dart';
import 'package:booking_app/app/booking/presentation/screens/trip_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../explore/presentation/screens/explore_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const Explore(),
    const TripsScren(),
    const ProfileInfoScreen(),
  ];
  void changeBottomNAv(int index) {
    currentIndex = index;
    emit(changeBottomNAvState());
  }
}
