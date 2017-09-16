import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/server/model/car/classification.dart';
import 'package:rentacar_spa/server/model/car/gearbox.dart';

class GearboxController extends HTTPController {
  @httpPost
  Future<Response> addGearbox(
    @HTTPQuery("title") String title
  ) async {
    var gearboxes;
    try {
      var query = new Query<Gearbox>()
        ..values.title = title;
      gearboxes = await query.insert();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return new Response.ok(gearboxes);
  }

  @httpGet
  Future<Response> getGearbox() async {
    var gearbox;
    try {
      var query = new Query<Gearbox>();
      gearbox = await query.fetch();
    } catch(exception, stackTrace) {
       print(exception);
      print(stackTrace);
    }
    return new Response.ok(gearbox);
  }

  @httpDelete
  Future<Response> removeGearbox(@HTTPPath('gearboxId') int id) async {
    int deletedCount;
    try {
      var query = new Query<Gearbox>()
        ..where.id = id;
      deletedCount = await query.delete();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return new Response.ok(deletedCount);
  }
}