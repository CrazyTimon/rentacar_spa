import 'package:rentacar_spa/interfaces/api_entity.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

abstract class ICar extends ApiEntity {
  int id;
  String title;
  IClassification classification;
}