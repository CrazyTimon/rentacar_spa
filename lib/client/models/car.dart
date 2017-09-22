import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

class Car implements ICar, ClientEntity {

  Car(this.title, this._gearbox, this._classification, [this.id]);

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
  }
  IGearbox _gearbox;

  @override
  int id;

  @override
  String title;

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
}