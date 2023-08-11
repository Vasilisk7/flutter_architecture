import 'package:flutter_architecture/data/services.dart';

class LightBeerService implements BeerService {
  @override
  bool pour() {
    return true;
  }
}
