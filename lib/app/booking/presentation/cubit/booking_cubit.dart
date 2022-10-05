import 'package:booking_app/app/booking/domain/entity/get_booking.dart';
import 'package:booking_app/app/booking/domain/usecases/create_booking_usecase.dart';
import 'package:booking_app/app/booking/domain/usecases/get_booking_usecase.dart';
import 'package:booking_app/app/booking/presentation/cubit/booking_state.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  final CreateBookingUseCase createBookingUseCase;
  final GetBookingUseCase getBookingUseCase;
  BookingCubit(
      {required this.createBookingUseCase, required this.getBookingUseCase})
      : super(InitailBookingState());
  static BookingCubit get(context) => BlocProvider.of(context);
  int? bookingId;
  Future<void> createBooking({required int hotelId}) async {
    emit(CreateBookingLoadingState());
    var response = await createBookingUseCase(hotelId);
    response.fold((l) {
      emit(CreateBookingErrorState(
          message: NetworkExceptions.getErrorMessage(l)));
    }, (r) {
      bookingId = r.bookingId;
      emit(CreateBookingLoadedState(message: r.messageEn));
    });
  }

  bool isBooking = false;
  void changeBooking() {
    isBooking = !isBooking;
    emit(ChangeBookingState());
  }

  List<GetBooking> listGetBooking = [];
  List<GetBooking> listCanceledBooking = [];
  List<GetBooking> listCompletedBooking = [];
  void getBooking({required TypeBooking typeBooking}) async {
    emit(GetBookingLoadingState());
    String type;
    if (TypeBooking.completed == typeBooking) {
      type = 'completed';
    } else if (TypeBooking.cancelled == typeBooking) {
      type = 'cancelled';
    } else {
      type = 'upcomming';
    }
    var response = await getBookingUseCase(type);
    response.fold((l) {
      emit(GetBookingErrorState(message: NetworkExceptions.getErrorMessage(l)));
    }, (r) {
      if (TypeBooking.completed == typeBooking) {
        listCompletedBooking = r;
      } else if (TypeBooking.cancelled == typeBooking) {
        listCanceledBooking = r;
      } else {
        listGetBooking = r;
      }

      emit(GetBookingLoadedState());
    });
  }
}

enum TypeBooking { upcomming, cancelled, completed }
