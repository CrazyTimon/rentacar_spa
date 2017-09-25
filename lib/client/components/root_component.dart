import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:rentacar_spa/client/components/car/car.dart';
import 'package:rentacar_spa/client/components/left_menu/left_menu.dart';


@Component(
  selector: 'my-app',
  templateUrl: 'root_component.html',
  directives: const [
    CarComponent,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    LeftMenu
  ],
  styleUrls: const [
    'package:angular_components/src/components/app_layout/layout.scss.css',
    'root_component.css',
  ],
  providers: const [
    popupBindings
  ]
)
class AppComponent {
  bool end = false;

  // CarManager _carManager;
  // ClassificationManager _clsManager;
  // GearboxManager _gearboxManager;

  // AppComponent(this._carManager) {
  //   _carManager.getAll();
  // }
}