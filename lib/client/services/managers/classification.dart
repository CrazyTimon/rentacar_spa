import 'dart:async';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

class ClassificationManager {
  final BaseApi<IClassification> _api;

  List<IClassification> _cache = [];

  ClassificationManager(BrowserClient _http):
    _api = new BaseApi<IClassification>(_http);

  Future<List<IClassification>> getAll([bool fetchData = false]) async {
    if (fetchData) {
      _cache = await fetch();
    }
    return _cache;
  }

  Future<Response> add(IClassification cls) => _api.add(cls);

  Future<Response> delete(IClassification cls) => _api.delete(cls);

  Future<Response> update(IClassification cls) => _api.update(cls);

  Future<List<IClassification>> fetch() => _api.getAll();

}