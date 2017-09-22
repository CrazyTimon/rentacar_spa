import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:rentacar_spa/client/components/root_component.dart';
import 'package:http/browser_client.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/models/gearbox.dart';
import 'package:rentacar_spa/client/services/api/base_api.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/client/services/managers/gearbox.dart';

void main() {
  BrowserClient browserClient = new BrowserClient();

  BaseApi<Gearbox> gearboxApi = new BaseApi<Gearbox>(browserClient);
  GearboxManager gearboxManager = new GearboxManager(gearboxApi);

  BaseApi<Classification> clsApi = new BaseApi<Classification>(browserClient);
  ClassificationManager clsManager = new ClassificationManager(clsApi);

  BaseApi<Car> carApi = new BaseApi<Car>(browserClient, clsManager, gearboxManager);
  CarManager carManager = new CarManager(carApi);
  bootstrap(AppComponent, [
    provide(BrowserClient, useFactory: () => browserClient, deps: []),
    provide(CarManager, useFactory: () => carManager, deps: []),
    provide(ClassificationManager, useFactory: () => clsManager, deps: []),
    provide(GearboxManager, useFactory: () => gearboxManager, deps: [])
  ]);
}