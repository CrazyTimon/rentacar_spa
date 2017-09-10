import 'package:angular2/angular2.dart';
import 'package:rentacar_spa/client/components/car/car.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'root_component.html',
  directives: const [
    CarComponent
  ]
)
class AppComponent {}