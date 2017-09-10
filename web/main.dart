import 'package:angular2/di.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/angular2.dart';
import 'package:rentacar_spa/client/components/root_component.dart';
import 'package:http/browser_client.dart';
import 'package:rentacar_spa/client/services/api/car.dart';
import 'package:rentacar_spa/client/services/api/classification.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';

void main() {
  BrowserClient browserClient = new BrowserClient();
  CarService carApi = new CarService(browserClient);
  ClassificationService clsApi = new ClassificationService(browserClient);
  bootstrap(AppComponent, [
    provide(BrowserClient, useFactory: () => browserClient, deps: []),
    provide(CarService, useFactory: () => carApi, deps: []),
    provide(ClassificationService, useFactory: () => clsApi, deps: []),
    provide(CarManager, useFactory: () => new CarManager(carApi), deps: []),
    provide(ClassificationManager, useFactory: () => new ClassificationManager(clsApi), deps: [])
  ]);
}