import 'dart:async';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

//TODO add base MANAGER

class ClassificationManager {
  final BaseApi<Classification> _api;

  List<IClassification> _cache = [];

  ClassificationManager(this._api);

  Future<List<IClassification>> getAll([bool fetchData = false]) async {
    if (fetchData) {
      _cache = await fetch();
    }
    return _cache;
  }

  Future<Response> add(Classification cls) => _api.add(cls);

  Future<Response> delete(Classification cls) => _api.delete(cls);

  Future<Response> update(Classification cls) => _api.update(cls);

  Future<List<IClassification>> fetch() => _api.getAll();

  Future<IClassification> get(int id) => _api.get(id);
}