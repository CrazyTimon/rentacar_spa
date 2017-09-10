import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/server/model/car/classification.dart';

class ClassificationController extends HTTPController {
  @httpPost
  Future<Response> addClassification(
    @HTTPQuery("title") String title,
    @HTTPQuery("description") String description,
  ) async {
    var databaseQuestions;
    try {
      var query = new Query<Classification>()
        ..values.title = title
        ..values.description = description;
      databaseQuestions = await query.insert();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return new Response.ok(databaseQuestions);
  }

  @httpGet
  Future<Response> getClassifications() async {
    var cls;
    try {
      var query = new Query<Classification>();
      cls = await query.fetch();
    } catch(exception, stackTrace) {
       print(exception);
      print(stackTrace);
    }
    return new Response.ok(cls);
  }

  @httpDelete
  Future<Response> removeClassifications(@HTTPPath('classificationId') int id) async {
    int deletedCount;
    try {
      var query = new Query<Classification>()
        ..where.id = id;
      deletedCount = await query.delete();
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }
    return new Response.ok(deletedCount);
  }
}