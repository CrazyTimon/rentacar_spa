import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:rentacar_spa/client/interfaces/base_manager.dart';
import 'package:rentacar_spa/client/services/managers/entity.dart';
import 'package:rentacar_spa/interfaces/car.dart';
import 'package:rentacar_spa/interfaces/client_entity.dart';
import 'package:rentacar_spa/rentacar_spa.dart';

@Component(
  selector: 'entity',
  templateUrl: 'entity.html',
  styleUrls: const ['entity.css'],
  directives: const [
    CORE_DIRECTIVES,
    formDirectives
  ]
)
class EntityComponent implements OnInit {
  final RouteParams _routeParams;
  final EntityManager _entityManager;
  @Input()
  ClientEntity entity;

  int id;

  EntityComponent(this._routeParams, this._entityManager);

  @override
  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    var _entity = _routeParams.get('entity');
    id = int.parse(_id ?? '', onError: (_) => null);
    BaseManager manager = _entityManager.parseEnity(_entity);
    if (id != null) entity = await (manager.get(id));
  }

  // HeroDetailComponent(this._heroService, this._routeParams);

  // @override
  // Future<Null> ngOnInit() async {
  //   var _id = _routeParams.get('id');
  //   var id = int.parse(_id ?? '', onError: (_) => null);
  //   if (id != null) entity = await (_heroService.getHero(id));
  // }
}