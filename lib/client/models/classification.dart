import 'package:rentacar_spa/interfaces/classification.dart';

class Classification extends IClassification {

  Classification();

  Classification.fromJson(Map map):
    id = map['id'],
    title = map['title'],
    description = map['description'];

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