import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/server/model/car/car.dart';

class Classification extends ManagedObject<_Classification> implements _Classification{}
class _Classification implements IClassification {

  @override
  @managedPrimaryKey
  int id;

  @override
  String title;

  @override
  String description;

  ManagedSet<Car> car;
}