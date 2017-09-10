import 'dart:async';
import 'dart:convert';
import 'package:angular2/di.dart';
import 'package:http/browser_client.dart';
import 'package:http/src/response.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/urls.dart' as urls;

@Injectable()
class ClassificationService implements BaseApi {
  final String _classificationUrl = urls.UrlUtils.generateUrl(urls.CLASSIFICATIONS);

  final BrowserClient _http;

  ClassificationService(this._http);

  @override
  Future<List<IClassification>> getAll() async {
    Response response = await _http.get(_classificationUrl);
    List<Map<String, dynamic>> responseDecoded = JSON.decode(response.body);
    Iterable<IClassification> convertedResponse = responseDecoded.map((Map<String, dynamic> value) => new Classification.fromJson(value));
    return convertedResponse.toList();
  }

  @override
  Future<IClassification> get(int id) async {
    Response response = await _http.get('$_classificationUrl/id');
    Map<String, dynamic> responseDecoded = JSON.decode(response.body);
    IClassification convertedResponse = new Classification.fromJson(responseDecoded);
    return convertedResponse;
  }

  @override
  Future<Response> add(IClassification cls) => _http.post(_classificationUrl, body: {
    'title': cls.title,
    'description': cls.description
  });

  @override
  Future<Response> deleteAll() => _http.delete(_classificationUrl);

  @override
  Future<Response> delete(IClassification cls) => _http.delete('$_classificationUrl/id');

  @override
  Future<Response> update(IClassification cls) => _http.put('$_classificationUrl/id', body: {
    'title': cls.title,
    'id': cls.id,
    'description': cls.description
  });
}