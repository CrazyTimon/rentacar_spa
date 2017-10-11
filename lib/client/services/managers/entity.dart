import 'dart:async';
import 'package:angular/di.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/models/gearbox.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/client/services/managers/gearbox.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';

@Injectable()
class EntityManager {

  Map<Type, BaseManager> _managers = {};
  Map<String, BaseManager> _managerStringMap = {};

  CarManager _carManager;
  GearboxManager _gearboxManager;
  ClassificationManager _classificationManager;

  EntityManager(
    this._carManager,
    this._gearboxManager,
    this._classificationManager
  ) {
    _managers[Car] = _carManager;
    _managers[Gearbox] = _gearboxManager;
    _managers[Classification] = _classificationManager;

    _managerStringMap['Car'] = _carManager;
    _managerStringMap['Gearbox'] = _gearboxManager;
    _managerStringMap['Classification'] = _classificationManager;
  }

  //todo надо выбрать что то одно, вообще это полуночный бред, надо что то с этим сделать
  BaseManager parseEnity(String value) => _managerStringMap[value];

  Future<ClientEntity> getEntity(Type t, int id) async {
    return await getEntityManager(t).get(id);
  }

  BaseManager getEntityManager(Type t) => _managers[t];
}