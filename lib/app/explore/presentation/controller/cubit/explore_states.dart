import 'package:equatable/equatable.dart';

abstract class ExploreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialExploreState extends ExploreState {}

class ExploreLoadingState extends ExploreState {}

class ExploreLoadedState extends ExploreState {}

class ExploreErrorState extends ExploreState {
  final String message;

  ExploreErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ChangeBottomNavBar extends ExploreState {}
