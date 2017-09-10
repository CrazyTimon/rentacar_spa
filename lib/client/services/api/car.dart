import 'dart:async';
import 'dart:convert';
import 'package:angular2/di.dart';
import 'package:http/browser_client.dart';
import 'package:http/src/response.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/urls.dart' as urls;

@Injectable()
class CarService implements BaseApi {
  final String _carsUrl = urls.UrlUtils.generateUrl(urls.CARS);

  final BrowserClient _http;

  CarService(this._http);

  @override
  Future<List<ICar>> getAll() async {
    Response response = await _http.get(_carsUrl);
    List<Map<String, dynamic>> responseDecoded = JSON.decode(response.body);
    Iterable<ICar> convertedResponse = responseDecoded.map((Map<String, dynamic> value) => new Car.fromJson(value));
    return convertedResponse.toList();
  }

  @override
  Future<ICar> get(int id) async {
    Response response = await _http.get('$_carsUrl/id');
    Map<String, dynamic> responseDecoded = JSON.decode(response.body);
    ICar convertedResponse = new Car.fromJson(responseDecoded);
    return convertedResponse;
  }

  @override
  Future<Response> add(ICar car) => _http.post(_carsUrl, body: {
    'title': car.title,
    'classificationId': '4123'
  });

  @override
  Future<Response> deleteAll() => _http.delete(_carsUrl);

  @override
  Future<Response> delete(ICar car) => _http.delete('$_carsUrl/${car.id}');

  @override
  Future<Response> update(ICar car) => _http.put('$_carsUrl/${car.id}', body: {
      'title': car.title
  });

}