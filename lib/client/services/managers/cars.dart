import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:http/browser_client.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/car.dart';

@Injectable()
class CarManager {
  final BaseApi<ICar> _api;
  final BrowserClient _http;

  CarManager(this._http):
    _api = new BaseApi<ICar>(_http);

  Future getAll() => _api.getAll();

  Future add(ICar car) => _api.add(car);

  Future delete(ICar car) => _api.delete(car);

  Future update(ICar car) => _api.update(car);
}