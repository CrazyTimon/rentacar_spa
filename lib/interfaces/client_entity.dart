import 'package:rentacar_spa/interfaces/entity.dart';

abstract class ClientEntity extends Entity {

  Map<String, dynamic> get addRequestParams;

  Map<String, dynamic> get updateRequestParams;
}