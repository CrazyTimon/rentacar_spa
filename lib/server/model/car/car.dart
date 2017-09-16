import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/server/model/car/classification.dart';
import 'package:rentacar_spa/server/model/car/gearbox.dart';

class Car extends ManagedObject<_Car> implements _Car, ICar{}
class _Car {
  @managedPrimaryKey int id;

  @ManagedColumnAttributes(defaultValue: "''")
  String title;

  @ManagedRelationship(#car)
  Classification classification;

  @ManagedRelationship(#car)
  Gearbox gearbox;
}