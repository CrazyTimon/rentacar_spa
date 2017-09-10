import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

class Car implements ICar {

  @override
  IClassification classification;

  @override
  Car();

  Car.fromJson(Map map) {
    id = map['id'];
    title = map['title'];
  }

  @override
  int id;

  @override
  String title;
}