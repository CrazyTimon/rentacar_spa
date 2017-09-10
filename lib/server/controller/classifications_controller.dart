import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/server/model/car/classification.dart';

class ClassificationsController extends HTTPController {
  @httpGet
  Future<Response> getClassifications() async {
    var cars;
    try {
      var query = new Query<Classification>();
      cars = await query.fetch();
    } catch(exception, stackTrace) {
       print(exception);
      print(stackTrace);
    }
    return new Response.ok(cars);
  }
}