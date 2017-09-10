import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/interfaces/car.dart';

@Component(
  selector: 'car-row',
  templateUrl: 'car_row.html',
  styleUrls: const ['car_row.css'],
  directives: const [
    CORE_DIRECTIVES,
    MaterialProgressComponent,
    MaterialInputComponent
  ]
)
class CarRowComponent {

  final _onDeleteController = new StreamController<ICar>();
  CarManager _carManager;
  ClassificationManager _clsManager;

  @ViewChild(MaterialInputComponent) MaterialInputComponent input;

  bool carTitleEditMode = false;
  bool inProgress = false;

  CarRowComponent(this._carManager, this._clsManager);

  @Output('onDeleted') Stream<ICar> get enterPressed => _onDeleteController.stream;
  @Input() ICar car;

  void onDeleteBtnClick(MouseEvent event) {
    _deleteCar();
  }

  void ondblclick(MouseEvent event) {
    carTitleEditMode = true;
    new Future.delayed(new Duration(milliseconds: 100), () {
      (input.inputEl.nativeElement as InputElement).value = car.title;
      input.focus();
    });
  }

  void onTitleBlur(FocusEvent event) {
    _updateTitle((event.currentTarget as InputElement).value);
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
}