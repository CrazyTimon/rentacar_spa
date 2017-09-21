import 'package:rentacar_spa/interfaces/gearbox.dart';

class Gearbox extends IGearbox {

  Gearbox();

  Gearbox.fromJson(Map map):
    id = map['id'],
    title = map['title'];

  @override
  int id;

  @override
  String title;

  @override
  Map<String, dynamic> get addRequestParams => {
    'title': title
  };

  @override
  Map<String, dynamic> get updateRequestParams => {
    'id': id,
    'title': title
  };
}