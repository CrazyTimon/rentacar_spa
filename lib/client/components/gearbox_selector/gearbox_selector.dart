import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:rentacar_spa/client/services/managers/gearbox.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';

@Component(
  selector: 'gearbox-selector',
  templateUrl: 'gearbox_selector.html',
  styleUrls: const ['gearbox_selector.css'],
  directives: const [
    CORE_DIRECTIVES,
    formDirectives,
  ]
)
class GearboxSelectorComponent {

  final _onChangeController = new StreamController<IGearbox>();
  GearboxManager _gearBoxManager;

  GearboxSelectorComponent(this._gearBoxManager) {
    _syncClassifications();
  }

  @Output('onChange') Stream<IGearbox> get onChange => _onChangeController.stream;
  @Input('selected') IGearbox selected;

  List<IGearbox> gearboxes = <IGearbox>[];

  Future _syncClassifications() async {
    gearboxes = await _gearBoxManager.getAll();
  }

  void onChanged(IGearbox selectedCls) {
    _onChangeController.add(selectedCls);
  }
}