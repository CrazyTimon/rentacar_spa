import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/server/model/car/classification.dart';
import 'package:rentacar_spa/server/model/car/gearbox.dart';

class Car extends ManagedObject<_Car> implements _Car {}
class _Car implements ICar {
  @override
  @managedPrimaryKey
  int id;

  @override
  @ManagedColumnAttributes(defaultValue: "''")
  String title;

  @override
  @ManagedRelationship(#car)
  Classification classification;

  @override
  @ManagedRelationship(#car)
  Gearbox gearbox;
}