import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:rentacar_spa/client/components/classification_selector/classification_selector.dart';
import 'package:rentacar_spa/client/components/gearbox_selector/gearbox_selector.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/client/services/managers/gearbox.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';

@Component(
  selector: 'car-row',
  templateUrl: 'car_row.html',
  styleUrls: const ['car_row.css'],
  directives: const [
    CORE_DIRECTIVES,
    formDirectives,
    MaterialProgressComponent,
    MaterialInputComponent,
    ClassificationSelectorComponent,
    GearboxSelectorComponent
  ]
)
class CarRowComponent {

  final _onDeleteController = new StreamController<ICar>();
  CarManager _carManager;
  ClassificationManager _clsManager;
  GearboxManager _gearboxManager;

  @ViewChild(MaterialInputComponent) MaterialInputComponent input;

  bool carTitleEditMode = false;
  bool inProgress = false;

  IClassification selectedCls;
  IGearbox selectedGearBox;

  List<IClassification> classifications = <IClassification>[];
  List<IGearbox> gearboxes = <IGearbox>[];

  CarRowComponent(this._carManager, this._clsManager, this._gearboxManager) {
    _syncClassifications();
    _syncGearboxes();
  }

  @Output('onDeleted') Stream<ICar> get enterPressed => _onDeleteController.stream;
  @Input() Car car;

  void onDeleteBtnClick(MouseEvent event) {
    _deleteCar();
  }

  void ondblclick(MouseEvent event) {
    carTitleEditMode = true;
    //todo wtf?
    new Future.delayed(new Duration(milliseconds: 100), () {
      (input.inputEl.nativeElement as InputElement).value = car.title;
      input.focus();
    });
  }

  void onTitleBlur(FocusEvent event) {
    _updateTitle((event.currentTarget as InputElement).value);
  }

  void onChanged(IClassification selectedCls) {
    // car.classificationId = selectedCls.id;
    car.classification = selectedCls;
    _carManager.update(car);
  }

  void onGearBoxChanged(IGearbox selectedGearbox) {
    // car.gearboxId = selectedGearbox.id;
    car.gearbox = selectedGearbox;
    _carManager.update(car);
  }

  Future _updateTitle(String value) async {
    inProgress = true;
    car.title = value;
    await _carManager.update(car);
    inProgress = false;
    carTitleEditMode = false;
  }

  Future _deleteCar() async {
    await _carManager.delete(car);
    _onDeleteController.add(car);
  }

  Future _syncClassifications() async {
    classifications = await _clsManager.getAll();
    selectedCls = classifications.firstWhere((IClassification cls) =>
      cls.id == car.classificationId,
      orElse: () => null);
  }

  Future _syncGearboxes() async {
    gearboxes = await _gearboxManager.getAll();
    selectedGearBox = gearboxes.firstWhere((IGearbox gbx) =>
      gbx.id == car.gearboxId,
      orElse: () => null);
  }
}