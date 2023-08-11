part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class MainYesBeer extends MainState {
  @override
  List<Object> get props => [];
}

class MainNoBeer extends MainState {
  @override
  List<Object> get props => [];
}