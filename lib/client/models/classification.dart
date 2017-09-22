import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';

class Classification implements IClassification, ClientEntity {

  Classification(this.title, this.description, [this.id]);

  @override
  int id;

  @override
  String title;

  @override
  String description;

  @override
  Map<String, dynamic> get addRequestParams => {
    'title': title,
    'description': description
  };

  @override
  Map<String, dynamic> get updateRequestParams => {
    'title': title,
    'id': id,
    'description': description
  };
}