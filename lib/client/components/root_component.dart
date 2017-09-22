import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
// import 'package:rentacar_spa/client/components/car/car.dart';


@Component(
  selector: 'my-app',
  templateUrl: 'root_component.html',
  directives: const [
    // CarComponent
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent
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
}