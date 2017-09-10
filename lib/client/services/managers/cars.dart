import 'dart:async';
import 'package:rentacar_spa/client/services/api/car.dart';
import 'package:rentacar_spa/interfaces/car.dart';

class CarManager {
  final CarService _api;

  CarManager(this._api);

  List<ICar> _cars = [];

  List<ICar> get cars => _cars;

  Future getAll() => _api.getAll();

  Future add(ICar car) => _api.add(car);

  Future delete(ICar car) => _api.delete(car);

  Future update(ICar car) => _api.update(car);
}