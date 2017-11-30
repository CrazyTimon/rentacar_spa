import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/services/managers/entity.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';

@Component(
  selector: 'entity-field',
  templateUrl: 'entity_field.html',
  styleUrls: const ['entity_field.css'],
  directives: const [
    displayNameRendererDirective,
    MaterialDropdownSelectComponent,
    NgIf
  ]
)
class EntityFieldComponent implements AfterViewInit {
  final EntityManager _entityManager;

  EntityFieldComponent(this._entityManager);

  @Input()
  EntityField field;

  final StreamController<ValueChangeEvent> _changeController = new StreamController<ValueChangeEvent>.broadcast();
  @Output()
  Stream<ValueChangeEvent> get valueChange => _changeController.stream;

  ItemRenderer<EntityWithTitle> itemRenderer = new CachingItemRenderer<EntityWithTitle>((entity) => entity.title);

  SelectionModel<EntityWithTitle> singleSelectModel = new SelectionModel<EntityWithTitle>.withList();

  String get selectionLabel =>
      singleSelectModel.selectedValues.length > 0
          ? itemRenderer(singleSelectModel.selectedValues.first)
          : '';

  bool get isFieldLink => field.type == EntityFieldsType.link;

  SelectionOptions options = new SelectionOptions.fromList([]);

  BaseManager entityManager;

  @override
  void ngAfterViewInit() {
    _init();
  }

  Future<Null> _init() async {
    if (field.type == EntityFieldsType.link) {
      EntityFieldLinkValue value = field.value as EntityFieldLinkValue;
      //todo переделать, надо доставать все возможные значения для дропдауна
      EntityWithTitle entity = await _entityManager.getEntity(value.entity, value.value) as EntityWithTitle;
      entityManager = _entityManager.getEntityManager(value.entity);
      List<ClientEntity> availableOptions = await entityManager.getAll();

      singleSelectModel.select(entity);
      options.optionGroups = <OptionGroup<ClientEntity>>[new OptionGroup<ClientEntity>.withLabel(availableOptions)];
      // options.optionsList.add(availableOptions);

      scheduleMicrotask(_listenSelectionChange);
    }
  }

  void _listenSelectionChange(){
    singleSelectModel.selectionChanges.listen((List<SelectionChangeRecord<EntityWithTitle>> records){
      // entityManager.fetch()
      print(field);
      _changeController.add(new ValueChangeEvent(field, records.first.added.first););
      print(records.first);
    });
  }
}

class ValueChangeEvent {
  final EntityField field;
  final EntityWithTitle value;

  ValueChangeEvent(this.field, this.value);
}
