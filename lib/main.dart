import 'package:booking_app/app/auth/data/local/cached_helper.dart';
import 'package:booking_app/app/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:booking_app/app/auth/presentation/controller/observer/bloc_observer.dart';
import 'package:booking_app/app/auth/presentation/screens/splach_screen.dart';
import 'package:booking_app/app/booking/presentation/cubit/booking_cubit.dart';
import 'package:booking_app/app/explore/presentation/controller/cubit/explore_cubit.dart';
import 'package:booking_app/app/search/presentation/controller/cubit.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/home_Screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'config/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.initSharedPref();
  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  token = CachedHelper.getData(key: "token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchCubit>()..getSearch(),
        ),
        BlocProvider(
            create: ((context) =>
                ExploreCubit(getHotelsUseCase: sl())..getHotels())),
        BlocProvider(create: (context) => sl<BookingCubit>()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Booking App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: token != null ? HomeLayOut() : const SplachScreen());
      }),
    );
  }
}
