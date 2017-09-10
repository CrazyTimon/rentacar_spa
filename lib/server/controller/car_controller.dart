import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/server/model/car/car.dart';

class CarController extends HTTPController {
// class CarController extends QueryController<Car> {

  @httpPost
  Future<Response> addNewCar(@HTTPQuery("title") String title ) async {
    var databaseQuestions;
    try {
      var query = new Query<Car>()
        ..values.title = title;
      databaseQuestions = await query.insert();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return new Response.ok(databaseQuestions);
  }

  // @httpGet
  // Future<Response> getAllQuestions() async {
  //   var query = new Query<Car>()
  //     ..values.title = 'example car';
  //   var databaseQuestions = await query.insert();

  //   return new Response.ok(databaseQuestions);
  // }
}

//aqueduct auth add-client --id com.app.mobile --secret foobar --redirect-uri https://somewhereoutthere.com