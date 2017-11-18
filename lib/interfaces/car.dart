import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/interfaces/entity.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';

abstract class ICar extends Entity {
  String title;
  IGearbox get gearbox;
  IClassification get classification;
}