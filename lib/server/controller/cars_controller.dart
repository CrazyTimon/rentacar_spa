import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/server/model/car/car.dart';
import 'package:rentacar_spa/server/model/car/classification.dart';

class CarsController extends HTTPController {
  @httpGet
  Future<Response> getCars() async {
    var cars;
    try {
      var query = new Query<Car>();
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
  ) async {
    var databaseQuestions;
    try {
      IClassification cls = await _getCls(classificationId);
      var query = new Query<Car>();
      query.values
        ..classification = cls
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
    @HTTPQuery('title') String title
  ) async {
    Car car;
    try {
      Query<Car> query = new Query<Car>()
        ..values.title = title
        ..where.id = whereEqualTo(carId);
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

  Future<Car> _getCarQuery(int id) async {
    Car car;
    try {
      Query<Car> query = new Query<Car>()
        ..values.id = id;
      car = await query.fetchOne();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return car;
  }

  Future<Classification> _getCls(int id) async {
    Classification cls;
    try {
      Query<Classification> query = new Query<Classification>()
        ..values.id = id;
      cls = await query.fetchOne();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return cls;
  }
}