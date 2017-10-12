import 'dart:async';
import 'package:angular/angular.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/services/managers/entity.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';

@Component(
  selector: 'entity-field',
  templateUrl: 'entity_field.html',
  styleUrls: const ['entity_field.css']
)
class EntityFieldComponent {
  final EntityManager _entityManager;

  @Input()
  EntityField field;

  EntityFieldComponent(this._entityManager);

  void ngAfterViewInit() {
    _init();
  }

  Future<Null>_init() async {
    if (field.type == EntityFieldsType.link) {
      EntityFieldLinkValue value = field.value as EntityFieldLinkValue;
      //todo переделать, надод доставать все возможные значения для дропдауна
      ClientEntity entity = await _entityManager.getEntity(value.entity, value.value);
    }
  }
}