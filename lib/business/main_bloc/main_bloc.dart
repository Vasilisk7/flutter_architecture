import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/service_provider.dart';
import 'package:flutter_architecture/data/services.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({BeerService? beerService})
      : _beerService = beerService ?? getIt<BeerService>(),
        // Заложил логику для дальнейшего тестировани блока,
        // все сервисы которые используются в блоке передаются изне
        super(MainInitial()) {
    on<MainEatBeer>(_onMainEatBeer);
  }

  final BeerService _beerService;

  Future<void> _onMainEatBeer(
    MainEatBeer event,
    Emitter<MainState> emit,
  ) async {
    if (_beerService.pour()) {
      emit(MainYesBeer());
    } else {
      emit(MainNoBeer());
    }
  }
}
