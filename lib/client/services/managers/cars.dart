import 'dart:async';
import 'package:angular/angular.dart';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/client/services/managers/gearbox.dart';

@Injectable()
class CarManager implements BaseManager {
  final BaseApi<Car> _api;
  final GearboxManager _gearBoxManager;
  final ClassificationManager _classificationManager;

  CarManager(this._api, this._gearBoxManager, this._classificationManager);

  @override
  Future<List<Car>> getAll([bool fetchData = false]) => _api.getAll();

  @override
  Future<Response> add(covariant Car car) => _api.add(car);

  @override
  Future<Response> delete(covariant Car car) => _api.delete(car);

  @override
  Future<Response> update(covariant Car car) => _api.update(car);

  @override
  Future<List<Car>> fetch() => _api.getAll();

  @override
  Future<Car> get(int id, {bool fetchSubmodels: false}) async {
    Car car = await _api.get(id);

    //todo паралельно запрашивать подмодели
    car.gearbox = await _gearBoxManager.get(car.gearboxId);
    car.classification = await _classificationManager.get(car.classificationId);
    return car;
  }
}