import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/interfaces/rent_duration.dart';

class RentDuration extends ManagedObject<_RentDuration> implements _RentDuration{}
class _RentDuration implements IRentDuration{
  @override
  @managedPrimaryKey int id;

  @override
  String title;
}