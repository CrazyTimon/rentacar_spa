import 'dart:async';
import 'package:http/src/response.dart';
import 'package:rentacar_spa/interfaces/api_entity.dart';

abstract class BaseApi {
  Future<ApiEntity> get(covariant int entity);
  Future<Response> add(covariant ApiEntity entity);
  Future<Response> delete(covariant ApiEntity entity);
  Future<Response> update(covariant ApiEntity entity);

  Future<List<ApiEntity>> getAll();
  Future<Response> deleteAll();
}