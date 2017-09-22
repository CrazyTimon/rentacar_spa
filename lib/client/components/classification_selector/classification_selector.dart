import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/interfaces/classification.dart';

@Component(
  selector: 'classification-selector',
  templateUrl: 'classification_selector.html',
  styleUrls: const ['classification_selector.css'],
  directives: const [
    CORE_DIRECTIVES,
    formDirectives
  ]
)
class ClassificationSelectorComponent {

  final _onChangeController = new StreamController<IClassification>();
  ClassificationManager _clsManager;

  ClassificationSelectorComponent(this._clsManager) {
    _syncClassifications();
  }

  @Output('onChange') Stream<IClassification> get onChange => _onChangeController.stream;
  @Input('selected') IClassification selected;

  List<IClassification> classifications = <IClassification>[];

  Future _syncClassifications() async {
    classifications = await _clsManager.getAll();
  }


  void onChanged(IClassification selectedCls) {
    _onChangeController.add(selectedCls);
  }
}