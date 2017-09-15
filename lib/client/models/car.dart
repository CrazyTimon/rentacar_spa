import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

class Car implements ICar {

  @override
  int classificationId;

  @override
  Car();

  Car.fromJson(Map map) {
    id = map['id'];
    title = map['title'];
    //TODO get from CLS storage
    if (map['classification'] != null) {
      classificationId = map['classification']['id'];
    }
  }

  @override
  int id;

  @override
  String title;

  @override
  Map<String, dynamic> get addRequestParams => {
    'title': title,
    'classificationId': classificationId.toString()
  };

  @override
  Map<String, dynamic> get updateRequestParams => {
    //TODO optimize it, need to send only changed field
    'title': title,
    'classificationId': classificationId.toString()
  };
}