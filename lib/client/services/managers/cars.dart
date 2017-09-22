import 'dart:async';
import 'package:angular/angular.dart';
import 'package:http/browser_client.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/interfaces/car.dart';

//TODO add base MANAGER

@Injectable()
class CarManager {
  final BaseApi<Car> _api;

  CarManager(this._api);

  Future<Iterable<ICar>> getAll() => _api.getAll();

  Future add(Car car) => _api.add(car);

  Future delete(Car car) => _api.delete(car);

  Future update(Car car) => _api.update(car);
}