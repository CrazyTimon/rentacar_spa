import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'dart:io';

class RootController extends HTTPController {

  @httpGet
  Future<Response> getAllCars() async {
    // var questionQuery = new Query<Car>();
    // var databaseQuestions = await questionQuery.fetch();
    return new Response.ok('''
<html lang="en-RU">
<head></head>
<body>
<form action="/car/create" method="POST">
    <input name="title"/>
    <button type="submit" value="submit">submit</button>
</form>
</body>
</html>
    ''')..contentType = ContentType.HTML;
  }

  // @httpGet
  // Future<Response> getQuestionAtIndex(@HTTPPath("index") int index) async {
  //   var questionQuery = new Query<Question>()
  //     ..where.index = whereEqualTo(index);

  //   var question = await questionQuery.fetchOne();

  //   if (question == null) {
  //     return new Response.notFound();
  //   }
  //   return new Response.ok(question);
  // }

  // @httpGet
  // Future<Response> getQuestionAtIndex(@HTTPPath("index") int index) async {
  //   // if (index < 0 || index >= questions.length) {
  //   //   return new Response.notFound();
  //   // }

  //   // return new Response.ok(questions[index]);
  //   return new Response.ok("131313123");
  // }
}

//aqueduct auth add-client --id com.app.mobile --secret foobar --redirect-uri https://somewhereoutthere.com