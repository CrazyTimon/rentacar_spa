import 'package:rentacar_spa/interfaces/car.dart';

class Car implements ICar {

  @override
  int classificationId;

  @override
  Car();

  @override
  int gearboxId;

  Car.fromJson(Map map) {
    id = map['id'];
    title = map['title'];
    //TODO get from CLS storage
    if (map['classification'] != null) {
      classificationId = map['classification']['id'];
    }
    if (map['gearbox'] != null) {
      gearboxId = map['gearbox']['id'];
    }
  }

  @override
  int id;

  @override
  String title;

  @override
  Map<String, dynamic> get addRequestParams => {
    'title': title,
    'classificationId': classificationId.toString(),
    'gearboxId': gearboxId.toString()
  };

  @override
  Map<String, dynamic> get updateRequestParams => {
    //TODO optimize it, need to send only changed field
    'title': title,
    'classificationId': classificationId.toString(),
    'gearboxId': gearboxId.toString()
  };

}