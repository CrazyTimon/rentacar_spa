import 'dart:async';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/models/gearbox.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';

class GearboxManager implements BaseManager {
  final BaseApi<Gearbox> _api;

  List<IGearbox> _cache = [];

  GearboxManager(this._api);

  @override
  Future<List<Gearbox>> getAll([bool fetchData = false]) async {
    if (fetchData) {
      _cache = await fetch();
    }
    return _cache;
  }

  @override
  Future<Response> add(covariant Gearbox cls) => _api.add(cls);

  @override
  Future<Response> delete(covariant Gearbox cls) => _api.delete(cls);

  @override
  Future<Response> update(covariant Gearbox cls) => _api.update(cls);

  @override
  Future<List<Gearbox>> fetch() => _api.getAll();

  @override
  Future<Gearbox> get(int id, {bool fetchSubmodels: false}) => _api.get(id);
}