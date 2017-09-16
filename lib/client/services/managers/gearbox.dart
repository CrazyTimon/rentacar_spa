import 'dart:async';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';

class GearboxManager {
  final BaseApi<IGearbox> _api;

  List<IGearbox> _cache = [];

  GearboxManager(BrowserClient _http):
    _api = new BaseApi<IGearbox>(_http);

  Future<List<IGearbox>> getAll([bool fetchData = false]) async {
    if (fetchData) {
      _cache = await fetch();
    }
    return _cache;
  }

  Future<Response> add(IGearbox cls) => _api.add(cls);

  Future<Response> delete(IGearbox cls) => _api.delete(cls);

  Future<Response> update(IGearbox cls) => _api.update(cls);

  Future<List<IGearbox>> fetch() => _api.getAll();

}