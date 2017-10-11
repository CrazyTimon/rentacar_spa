import 'dart:async';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

class ClassificationManager implements BaseManager {
  final BaseApi<Classification> _api;

  List<IClassification> _cache = [];

  ClassificationManager(this._api);

  @override
  Future<List<Classification>> getAll([bool fetchData = false]) async {
    if (fetchData) {
      _cache = await fetch();
    }
    return _cache;
  }

  @override
  Future<Response> add(covariant Classification cls) => _api.add(cls);

  @override
  Future<Response> delete(covariant Classification cls) => _api.delete(cls);

  @override
  Future<Response> update(covariant Classification cls) => _api.update(cls);

  @override
  Future<List<Classification>> fetch() => _api.getAll();

  @override
  Future<Classification> get(int id) => _api.get(id);
}