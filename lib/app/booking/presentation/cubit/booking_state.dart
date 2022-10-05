abstract class BookingState {}

class InitailBookingState extends BookingState {}

class CreateBookingLoadingState extends BookingState {}

class CreateBookingLoadedState extends BookingState {
  final String message;

  CreateBookingLoadedState({required this.message});
}

class CreateBookingErrorState extends BookingState {
  final String message;

  CreateBookingErrorState({required this.message});
}

class GetBookingLoadingState extends BookingState {}

class GetBookingLoadedState extends BookingState {}

class GetBookingErrorState extends BookingState {
  final String message;

  GetBookingErrorState({required this.message});
}

class ChangeBookingState extends BookingState {}
