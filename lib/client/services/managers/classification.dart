import 'dart:async';
import 'package:http/http.dart';
import 'package:rentacar_spa/client/services/api/classification.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

class ClassificationManager {
  final ClassificationService _api;

  ClassificationManager(this._api);

  List<ICar> _cars = [];

  List<ICar> get cars => _cars;

  Future<List<IClassification>> getAll() => _api.getAll();

  Future<Response> add(IClassification cls) => _api.add(cls);

  Future<Response> delete(IClassification cls) => _api.delete(cls);

  Future<Response> update(IClassification cls) => _api.update(cls);
}