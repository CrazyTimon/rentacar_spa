import 'dart:async';
import 'package:http/src/response.dart';
import 'package:rentacar_spa/interfaces/api_entity.dart';
import 'dart:async';
import 'dart:convert';
import 'package:angular2/di.dart';
import 'package:http/browser_client.dart';
import 'package:http/src/response.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/urls.dart' as urls;

// abstract class BaseApi1<ApiEntity> {
//   Future<T> get(covariant int entity);
//   Future<Response> add(covariant T entity);
//   Future<Response> delete(covariant T entity);
//   Future<Response> update(covariant T entity);

//   Future<List<ApiEntity>> getAll();
//   Future<Response> deleteAll();
// }

//возможно лушче делать через провайдеры, типо: прокидывать то,
//какую сущность мы хотим тут создавать, напирмер для 
class BaseApi<T extends ApiEntity> {
  final String _dataSyncUrl;

  T entity = new T();

  Future<T> get(covariant int entity) async {
    Response response = await _http.get('$_dataSyncUrl/id');
    Map<String, dynamic> responseDecoded = JSON.decode(response.body);
    T convertedResponse = new T.fromJson(responseDecoded);
    return convertedResponse;
  }

  Future<Response> add(covariant T entity) => _http.post(_dataSyncUrl, body: t.addRequestParams);
  // Future<Response> add(covariant T entity) => _http.post(_dataSyncUrl, body: {
  //   'title': car.title,
  //   'classificationId': '4123'
  // });
  Future<Response> delete(covariant ApiEntity entity);
  Future<Response> update(covariant ApiEntity entity);

  Future<List<ApiEntity>> getAll();
  Future<Response> deleteAll();
}