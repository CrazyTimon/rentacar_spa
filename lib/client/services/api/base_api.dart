import 'dart:async';
import 'package:http/src/response.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/models/gearbox.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/client/services/managers/gearbox.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';
import 'package:rentacar_spa/interfaces/entity.dart';
import 'dart:convert';
import 'package:http/browser_client.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';
import 'package:rentacar_spa/urls.dart' as urls;

class BaseApi<T extends ClientEntity> {

  String _dataSyncUrl = _ApiFactory.getSyncUrl(T);

  final _ApiFactory apiFactory;
  final BrowserClient _http;

  BaseApi(
    this._http,
    [
      ClassificationManager _classificationManager,
      GearboxManager _gearboxManager
    ]
  ):
    apiFactory = new _ApiFactory(
      _classificationManager,
      _gearboxManager
    );

  Future<T> get(int entity) async {
    Response response = await _http.get('$_dataSyncUrl/$entity');
    Map<String, dynamic> responseDecoded = JSON.decode(response.body);
    return await apiFactory.factory(T, responseDecoded);
  }

  Future<List<T>> getAll() async {
    Response response = await _http.get(_dataSyncUrl);
    List<Map<String, dynamic>> responseDecoded = JSON.decode(response.body);
    List<Entity> convertedResponse = [];
    if (responseDecoded.isNotEmpty) {
      await Future.forEach(responseDecoded, (Map<String, dynamic> _r) async {
          ClientEntity ent = await apiFactory.factory(T, _r);
          convertedResponse.add(ent);
        });
    }
    return convertedResponse.toList();
  }

  Future<Response> add(ClientEntity entity) => _http.post(_dataSyncUrl, body: entity.addRequestParams);

  Future<Response> deleteAll() => _http.delete(_dataSyncUrl);

  Future<Response> delete(T entity) => _http.delete('$_dataSyncUrl/${entity.id}');

  Future<Response> update(T entity) => _http.put('$_dataSyncUrl/${entity.id}', body: entity.updateRequestParams);
}

class _ApiFactory {

  ClassificationManager _classificationManager;
  GearboxManager _gearboxManager;

  _ApiFactory(
    this._classificationManager,
    this._gearboxManager
  );

  Future<Entity> factory(Type t, Map map) async {
    if (t == Car) {
      IClassification cls = await _classificationManager.get(map['classification']['id']);
      IGearbox gearbox = await _gearboxManager.get(map['gearbox']['id']);
      return new Car(map['title'], gearbox, cls, map['id']);
    }
    if (t == Classification) {
      return new Classification(map['title'], map['description'], map['id']);
    }

    if (t == Gearbox) {
      return new Gearbox(map['title'], map['id']);
    }
    else return null;
  }

  static String getSyncUrl(Type t) {
    if (t == Car) {
      return urls.UrlUtils.generateUrl(urls.CARS);
    }
    if (t == Classification) {
      return urls.UrlUtils.generateUrl(urls.CLASSIFICATIONS);
    }
    if (t == Gearbox) {
      return urls.UrlUtils.generateUrl(urls.GEARBOXES);
    }
    else return null;
  }
}