import 'package:rentacar_spa/interfaces/client_entity.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';

class Gearbox implements IGearbox, ClientEntity, EntityWithTitle {

  Gearbox(this.title, [this.id]);

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
  // TODO: implement fields
  @override
  List<EntityField> get fields => null;
}