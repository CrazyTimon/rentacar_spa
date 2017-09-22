import 'dart:async';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/models/gearbox.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';

//TODO add base MANAGER

class GearboxManager {
  final BaseApi<Gearbox> _api;

  List<IGearbox> _cache = [];

  GearboxManager(this._api);

  Future<List<IGearbox>> getAll([bool fetchData = false]) async {
    print('aaaaaaaaa');
    if (fetchData) {
      _cache = await fetch();
    }
    return _cache;
  }

  Future<Response> add(Gearbox cls) => _api.add(cls);

  Future<Response> delete(Gearbox cls) => _api.delete(cls);

  Future<Response> update(Gearbox cls) => _api.update(cls);

  Future<List<IGearbox>> fetch() => _api.getAll();

  Future<IGearbox> get(int id) => _api.get(id);
}