import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:rentacar_spa/client/components/car/car_row/car_row.dart';
import 'package:rentacar_spa/client/components/classification_selector/classification_selector.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:angular_components/angular_components.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

@Component(
  selector: 'car-management',
  templateUrl: 'car.html',
  styleUrls: const ['car.css'],
  directives: const [
    CORE_DIRECTIVES,
    FORM_DIRECTIVES,
    MaterialButtonComponent,
    MaterialFabComponent,
    GlyphComponent,
    CarRowComponent,
    ClassificationSelectorComponent
  ]
  // providers: const [
  //   CarApi,
  //   CarManager
  // ],
)
class CarComponent {
  ICar newCar = new Car();
  List<ICar> cars = [];
  bool isLoaded = false;

  CarManager _carManager;
  ClassificationManager _clsManager;

  IClassification newClassification = new Classification();
  List<IClassification> classifications;

  CarComponent(this._carManager, this._clsManager) {
    _fetchData();
  }

  Future _fetchData() async {
    await _fetchCars();
    await _fetchClassifications();
    isLoaded = true;
  }

  void onCardDeleted(ICar car) {
    _fetchCars();
  }

  void onCreateClick(MouseEvent event){
    _addCar(newCar).then((_)=>_fetchCars());
  }

  void onCreateClsClick(MouseEvent event){
    _addCls(newClassification).then((_)=>_fetchClassifications());
  }

  void onFetchClick(MouseEvent event){
    _fetchCars();
  }

  void onFetchClsClick(MouseEvent event){
    _fetchClassifications();
  }

  void onChanged(IClassification selectedCls) {
    newCar.classificationId = selectedCls.id;
  }

  Future _fetchCars() async {
    cars = await _carManager.getAll();
  }

  Future _fetchClassifications() async {
    classifications = await _clsManager.getAll(true);
  }

  Future _addCar(ICar car) async {
    await _carManager.add(car);
  }

  Future _addCls(IClassification cls) async {
    await _clsManager.add(cls);
  }
}