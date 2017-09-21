import 'package:rentacar_spa/interfaces/api_entity.dart';

abstract class ICar extends Entity {
  String title;
  int classificationId;
  int gearboxId;
}