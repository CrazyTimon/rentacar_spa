import 'dart:async';
import 'package:http/http.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';

abstract class BaseManager {
  Future<List<ClientEntity>> getAll([bool fetchData = false]);

  Future<Response> add(ClientEntity cls);

  Future<Response> delete(ClientEntity cls);

  Future<Response> update(ClientEntity cls);

  Future<List<ClientEntity>> fetch();

  Future<ClientEntity> get(int id);
}