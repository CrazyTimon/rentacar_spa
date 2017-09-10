import 'package:rentacar_spa/interfaces/api_entity.dart';

abstract class IClassification  extends ApiEntity {
  int id;
  String title;
  String description;
}