import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:rentacar_spa/client/components/entity/entity_field/entity_field.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/services/managers/entity.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';
import 'package:rentacar_spa/rentacar_spa.dart';

@Component(
  selector: 'entity',
  templateUrl: 'entity.html',
  styleUrls: const ['entity.css'],
  directives: const [
    CORE_DIRECTIVES,
    formDirectives,
    EntityFieldComponent
  ]
)
class EntityComponent implements OnInit {
  final RouteParams _routeParams;
  final EntityManager _entityManager;

  @Input()
  ClientEntity entity;

  EntityComponent(this._routeParams, this._entityManager);

  @override
  Future<Null> ngOnInit() async {
    String _id = _routeParams.get('id');
    String _entity = _routeParams.get('entity');
    int id = int.parse(_id ?? '', onError: (_) => null);
    BaseManager manager = _entityManager.parseEnity(_entity);
    if (id != null) {
      entity = await (manager.get(id, fetchSubmodels: true));
      print('asdasd');
    }
  }
}