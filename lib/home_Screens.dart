import 'package:booking_app/app/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:booking_app/app/booking/presentation/cubit/booking_cubit.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app_cubit/cubit.dart';
import 'app/app_cubit/states.dart';

class HomeLayOut extends StatefulWidget {
  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  @override
  void initState() {
    BlocProvider.of<BookingCubit>(context)
      ..getBooking(typeBooking: TypeBooking.upcomming)
      ..getBooking(typeBooking: TypeBooking.cancelled)
      ..getBooking(typeBooking: TypeBooking.completed);
    BlocProvider.of<AuthCubit>(context).getProfileInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              body: IndexedStack(
                index: cubit.currentIndex,
                children: cubit.screens,
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.changeBottomNAv(index);
                },
                currentIndex: cubit.currentIndex,
                fixedColor: AppColors.kGreenColor,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Explore'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border_outlined),
                      label: 'Trips'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline_outlined),
                      label: 'Profile'),
                ],
              ),
            );
          }),
    );
  }
}
