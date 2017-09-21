import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';
import 'package:rentacar_spa/server/model/car/car.dart';
import 'package:rentacar_spa/server/model/car/classification.dart';
import 'package:rentacar_spa/server/model/car/gearbox.dart';

class CarsController extends HTTPController {
  @httpGet
  Future<Response> getCars() async {
    var cars;
    try {
      var query = new Query<Car>()
        ..join(object: (car) => car.classification)
        ..join(object: (car) => car.gearbox);
      cars = await query.fetch();
    } catch(exception, stackTrace) {
       print(exception);
      print(stackTrace);
    }
    return new Response.ok(cars);
  }

  @httpPost
  Future<Response> addNewCar(
    @HTTPQuery('title') String title,
    @HTTPQuery('classificationId') int classificationId,
    @HTTPQuery('gearboxId') int gearboxId
  ) async {
    var databaseQuestions;
    try {
      IClassification cls = await _getCls(classificationId);
      IGearbox gearbox = await _geGearbox(gearboxId);
      var query = new Query<Car>();
      query.values
        ..classification = cls
        ..gearbox = gearbox
        ..title = title;

      databaseQuestions = await query.insert();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return new Response.ok(databaseQuestions);
  }

  @httpPut
  Future<Response> updateCar(
    @HTTPPath('carId') int carId,
    @HTTPQuery('title') String title,
    @HTTPQuery('classificationId') int classificationId,
    @HTTPQuery('gearboxId') int gearboxId
  ) async {
    Car car;
    try {
      IClassification cls = await _getCls(classificationId);
      IGearbox gearbox = await _geGearbox(gearboxId);
      Query<Car> query = new Query<Car>();
      query.values
        ..title = title
        ..gearbox = gearbox
        ..classification = cls;
      query.where.id = whereEqualTo(carId);

      car = await query.updateOne();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return new Response.ok(car);
  }

  @httpDelete
  Future<Response> removeCar(@HTTPPath("carId") int id) async {
    int deletedCount;
    try {
      var query = new Query<Car>()
        ..where.id = id;
      deletedCount = await query.delete();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return new Response.ok(deletedCount);
  }

  Future<Classification> _getCls(int id) async {
    Classification cls;
    try {
      Query<Classification> query = new Query<Classification>()
        ..where.id = whereEqualTo(id);
      cls = await query.fetchOne();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return cls;
  }

  Future<Gearbox> _geGearbox(int id) async {
    Gearbox cls;
    try {
      Query<Gearbox> query = new Query<Gearbox>()
        ..where.id = whereEqualTo(id);
      cls = await query.fetchOne();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return cls;
  }
}