import 'package:flutter_architecture/data/ligth_beer_service.dart';
import 'package:flutter_architecture/data/services.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class ServiceProvider {
  void init() {
    if (!getIt.isRegistered<BeerService>()) {
      getIt.registerSingletonAsync<BeerService>(() async => LightBeerService());
    }
  }
}
