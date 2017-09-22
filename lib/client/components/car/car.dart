import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:rentacar_spa/client/components/car/car_row/car_row.dart';
import 'package:rentacar_spa/client/components/classification_selector/classification_selector.dart';
import 'package:rentacar_spa/client/components/gearbox_selector/gearbox_selector.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/models/gearbox.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/client/services/managers/gearbox.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:angular_components/angular_components.dart';
import 'package:rentacar_spa/interfaces/classification.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';

@Component(
  selector: 'car-management',
  templateUrl: 'car.html',
  styleUrls: const ['car.css'],
  directives: const [
    CORE_DIRECTIVES,
    formDirectives,
    MaterialButtonComponent,
    MaterialFabComponent,
    GlyphComponent,
    CarRowComponent,
    ClassificationSelectorComponent,
    GearboxSelectorComponent
  ]
)
class CarComponent {
  List<ICar> cars = [];
  bool isLoaded = false;

  CarManager _carManager;
  ClassificationManager _clsManager;
  GearboxManager _gearboxManager;

  List<IClassification> classifications;
  List<IGearbox> gearboxes;

  CarComponent(this._carManager, this._clsManager, this._gearboxManager) {
    _fetchData();
  }

  Future _fetchData() async {
    await _fetchCars();
    await _fetchClassifications();
    await _fetchGearboxes();
    isLoaded = true;
  }

  void onCardDeleted(ICar car) {
    _fetchCars();
  }

  String newCartitle = '';

  void onCreateClick(MouseEvent event){
    Car newCar = new Car(newCartitle, _selectedGearbox, _selectedClassification);
    _addCar(newCar).then((_)=>_fetchCars());
  }

  String newClassificationTitle = '';
  String newClassificationDescription = '';
  void onCreateClsClick(MouseEvent event){
    Classification newClassification = new Classification(newClassificationTitle, newClassificationDescription);
    _addCls(newClassification).then((_)=>_fetchClassifications());
  }


  String newGearboxTitle = '';
  void onCreateGearboxClick(MouseEvent event) {
     Gearbox newGearbox = new Gearbox(newGearboxTitle);
    _addGearBox(newGearbox).then((_)=>_fetchGearboxes());
  }

  void onFetchClick(MouseEvent event) {
    _fetchCars();
  }

  void onFetchClsClick(MouseEvent event) {
    _fetchClassifications();
  }

  void onFetchGearboxClick(MouseEvent event) {
    _fetchGearboxes();
  }

  IGearbox _selectedGearbox;

  void onGearBoxChanged(IGearbox selectedGearbox) {
    _selectedGearbox = selectedGearbox;
  }

  IClassification _selectedClassification;

  void onClsChanged(IClassification selectedCls) {
    _selectedClassification = selectedCls;
  }

  Future _fetchCars() async {
    cars = await _carManager.getAll();
  }

  Future _fetchClassifications() async {
    classifications = await _clsManager.getAll(true);
  }

  Future _fetchGearboxes() async {
    gearboxes = await _gearboxManager.getAll(true);
  }

  Future _addCar(ICar car) async {
    await _carManager.add(car);
  }

  Future _addCls(IClassification cls) async {
    await _clsManager.add(cls);
  }

  Future _addGearBox(IGearbox gearbox) async {
    await _gearboxManager.add(gearbox);
  }
}