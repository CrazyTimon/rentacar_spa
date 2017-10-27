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

  @Input()
  EntityField field;

  ItemRenderer<ClientEntity> itemRenderer =
      new CachingItemRenderer<ClientEntity>(
          (entity) => (entity as EntityWithTitle).title);

  EntityFieldComponent(this._entityManager);

  bool get isFieldLink => field.type == EntityFieldsType.link;

  SelectionOptions options = new SelectionOptions.fromList([]);

  String selectedOption = '';

  @override
  void ngAfterViewInit() {
    _init();
  }

  Future<Null> _init() async {
    if (field.type == EntityFieldsType.link) {
      EntityFieldLinkValue value = field.value as EntityFieldLinkValue;
      //todo переделать, надод доставать все возможные значения для дропдауна
      EntityWithTitle entity = await _entityManager.getEntity(value.entity, value.value) as EntityWithTitle;
      selectedOption = entity.title;
      BaseManager entityManager = _entityManager.getEntityManager(value.entity);
      List<ClientEntity> availableOptions = await entityManager.getAll();
      options = new SelectionOptions.fromList(availableOptions);
    }
  }
}

// If the option does not support toString() that shows the label, the
// toFilterableString parameter must be passed to StringSelectionOptions.
class ExampleSelectionOptions<T> extends StringSelectionOptions<T> implements Selectable {
  ExampleSelectionOptions(List<T> options)
      : super(options, toFilterableString: (T option) => option.toString());

  ExampleSelectionOptions.withOptionGroups(List<OptionGroup> optionGroups)
      : super.withOptionGroups(optionGroups,
            toFilterableString: (T option) => option.toString());

  @override
  SelectableOption getSelectable(item) =>
      item is Language && item.code.contains('en')
          ? SelectableOption.Disabled
          : SelectableOption.Selectable;
}