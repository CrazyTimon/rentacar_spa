import 'dart:async';
import 'package:http/src/response.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/interfaces/api_entity.dart';
import 'dart:convert';
import 'package:http/browser_client.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/urls.dart' as urls;

class BaseApi<T extends Entity> {

  String _dataSyncUrl = _ApiFactory.getSyncUrl(T);

  final BrowserClient _http;

  BaseApi(this._http);

  Future<T> get(covariant int entity) async {
    Response response = await _http.get('$_dataSyncUrl/id');
    Map<String, dynamic> responseDecoded = JSON.decode(response.body);
    return _ApiFactory.factory(T, responseDecoded);
  }

  Future<List<T>> getAll() async {
    Response response = await _http.get(_dataSyncUrl);
    List<Map<String, dynamic>> responseDecoded = JSON.decode(response.body);
    Iterable<Entity> convertedResponse = responseDecoded.map(
      (Map<String, dynamic> value) => _ApiFactory.factory(T, value)
    );
    return convertedResponse.toList();
  }

  Future<Response> add(T entity) => _http.post(_dataSyncUrl, body: entity.addRequestParams);

  Future<Response> deleteAll() => _http.delete(_dataSyncUrl);

  Future<Response> delete(T entity) => _http.delete('$_dataSyncUrl/${entity.id}');

  Future<Response> update(T entity) => _http.put('$_dataSyncUrl/${entity.id}', body: entity.updateRequestParams);
}

class _ApiFactory {

  static Entity factory(Type t, Map map){
    if (t == ICar) {
      return new Car.fromJson(map);
    }
    if (t == IClassification) {
      return new Classification.fromJson(map);
    }
    else return null;
  }

  static String getSyncUrl(Type t) {
    if (t == ICar) {
      return urls.UrlUtils.generateUrl(urls.CARS);
    }

    if (t == IClassification) {
      return urls.UrlUtils.generateUrl(urls.CLASSIFICATIONS);
    }
    else return null;
  }
}