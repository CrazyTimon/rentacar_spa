import 'package:rentacar_spa/interfaces/entity.dart';

abstract class IClassification  extends Entity {
  int id;
  String title;
  String description;
}