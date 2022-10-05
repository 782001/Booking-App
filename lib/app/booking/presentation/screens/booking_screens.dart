import 'package:booking_app/app/booking/presentation/cubit/booking_cubit.dart';
import 'package:booking_app/app/booking/presentation/cubit/booking_state.dart';
import 'package:booking_app/config/services/service_locator.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BookingCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state is GetBookingErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                  content: CustomText(
                    text: state.message,
                    color: Colors.white,
                    size: 14,
                  )));
            } else if (state is CreateBookingLoadedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: const Color(0xff4FBE9E),
                  duration: const Duration(seconds: 2),
                  content: CustomText(
                    text: state.message,
                    color: Colors.white,
                    size: 14,
                  )));
            }
          },
          builder: (context, state) {
            var cubit = BookingCubit.get(context);
            print('${cubit.bookingId}');
            return Column(
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: state is GetBookingLoadingState
                          ? const CircularProgressIndicator()
                          : Container(
                              height: 45,
                              color: Colors.blue,
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.getBooking(
                                        typeBooking: TypeBooking.upcomming);
                                  },
                                  child: const CustomText(text: 'upcomming')),
                            ),
                    ),
                    Center(
                      child: state is GetBookingLoadingState
                          ? const CircularProgressIndicator()
                          : Container(
                              height: 45,
                              color: Colors.blue,
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.getBooking(
                                        typeBooking: TypeBooking.cancelled);
                                  },
                                  child: const CustomText(text: 'cancelled')),
                            ),
                    ),
                    Center(
                      child: state is GetBookingLoadingState
                          ? const CircularProgressIndicator()
                          : Container(
                              height: 45,
                              color: Colors.blue,
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.getBooking(
                                        typeBooking: TypeBooking.completed);
                                  },
                                  child: const CustomText(text: 'completed')),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Center(
                  child: state is CreateBookingLoadingState
                      ? const CircularProgressIndicator()
                      : Container(
                          height: 45,
                          color: Colors.blue,
                          child: ElevatedButton(
                              onPressed: () {
                                cubit.createBooking(hotelId: 24);
                              },
                              child: const CustomText(text: 'Booking')),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
