import 'dart:async';
import 'package:angular/angular.dart';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';

@Injectable()
class CarManager implements BaseManager {
  final BaseApi<Car> _api;

  CarManager(this._api);

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
  Future<Car> get(int id) => _api.get(id);
}