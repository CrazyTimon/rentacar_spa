import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/server/model/car/car.dart';

class Classification extends ManagedObject<_Classification> implements _Classification, IClassification {}
class _Classification {

  @managedPrimaryKey
  int id;

  String title;

  String description;

  ManagedSet<Car> car;
}