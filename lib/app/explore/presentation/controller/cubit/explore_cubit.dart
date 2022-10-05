import 'package:booking_app/app/explore/domain/entities/hotel.dart';
import 'package:booking_app/app/explore/domain/use_cases/get_hotels_usecase.dart';
import 'package:booking_app/app/explore/presentation/controller/cubit/explore_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final GetHotelsUseCase getHotelsUseCase;

  ExploreCubit({
    required this.getHotelsUseCase,
  }) : super(InitialExploreState());

  static ExploreCubit get(context) => BlocProvider.of(context);
  Data? data;
  Future getHotels() async {
    emit(ExploreLoadingState());
    var response = await getHotelsUseCase(
      const HotelParameters(
        count: 7,
      ),
    );
    print(response);
    response.fold((l) {
      emit(ExploreErrorState(message: l));
    }, (r) {
      data = r;
      emit(ExploreLoadedState());
    });
  }
}
