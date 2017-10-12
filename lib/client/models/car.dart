import 'package:rentacar_spa/client/models/gearbox.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

class Car implements ICar, ClientEntity {

  Car(String _title, this._gearbox, this._classification, [int _id]){
    title = _title;
    id = _id;
  }

  int get classificationId => classification.id;

  int get gearboxId => gearbox.id;

  @override
  IClassification get classification => _classification;
  set classification(IClassification _c){
    print('set classification');
    _classification = _c;
  }
  IClassification _classification;

  @override
  IGearbox get gearbox => _gearbox;
  set gearbox(IGearbox _b) {
    print('set gearbox');
    _gearbox = _b;
    fields.firstWhere((EntityField f)=> f.name == 'gearbox').value = new EntityFieldLinkValue(gearbox.id, Gearbox);
  }
  IGearbox _gearbox;

  int _id;
  @override
  int get id => _id;
  @override
  set id(int id) {
    _id = id;
    fields.firstWhere((EntityField f)=> f.name == 'id').value = new IntEntityFieldValue(id);
  }

  String _title;
  @override
  String get title => _title;
  @override
  set title(String t){
    _title = t;
    EntityField field = fields.firstWhere((EntityField f)=> f.name == 'title');
    field.value = new StringEntityFieldValue(t);
  }

  @override
  Map<String, dynamic> get addRequestParams => {
    'title': title,
    'classificationId': classificationId.toString(),
    'gearboxId': gearboxId.toString()
  };

  @override
  Map<String, dynamic> get updateRequestParams => {
    //TODO optimize it, need to send only changed field
    'title': title,
    'classificationId': classificationId.toString(),
    'gearboxId': gearboxId.toString()
  };

  @override
  List<EntityField> fields = [
    new EntityField('id', false, EntityFieldsType.singleValue),
    new EntityField('title', true, EntityFieldsType.singleValue),
    new EntityField('gearbox', true, EntityFieldsType.link)
  ];
}
// String title;
// IGearbox get gearbox;
// IClassification get classification;