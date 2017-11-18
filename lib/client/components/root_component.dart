import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:rentacar_spa/client/components/car_legacy/car.dart';
import 'package:rentacar_spa/client/components/entity/entity.dart';
import 'package:rentacar_spa/client/components/left_menu/left_menu.dart';
import 'package:angular_router/angular_router.dart';
import 'package:rentacar_spa/client/services/managers/entity.dart';

const String clientPrefix = 'client';

@Component(
  selector: 'my-app',
  templateUrl: 'root_component.html',
  directives: const [
    LegacyCarComponent,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    LeftMenu,
    ROUTER_DIRECTIVES
  ],
  styleUrls: const [
    'package:angular_components/src/components/app_layout/layout.scss.css',
    'root_component.css',
  ],
  providers: const [
    popupBindings,
    EntityManager
  ]
)
@RouteConfig(const [
  const Route(
    path: ':entity',
    name: 'Entities',
    component: EntityComponent
    // component: LegacyCarComponent
  ),
  // const Redirect(
  //   path: '/',
  //   redirectTo: const ['Heroes']
  // )
])
class AppComponent {
  bool end = false;

  // EntityManager _mngr;

  // AppComponent(this._mngr){
  //   // _testads();
  // }

  // Future<Null>_testads() async {
  //   Car c = await _mngr.getEntity(Car, 1);
  //   print(c.title);
  // }

  // CarManager _carManager;
  // ClassificationManager _clsManager;
  // GearboxManager _gearboxManager;

  // AppComponent(this._carManager) {
  //   _carManager.getAll();
  // }
}