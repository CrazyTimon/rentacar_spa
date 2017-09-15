import 'package:angular2/di.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/angular2.dart';
import 'package:rentacar_spa/client/components/root_component.dart';
import 'package:http/browser_client.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';

void main() {
  BrowserClient browserClient = new BrowserClient();
  bootstrap(AppComponent, [
    provide(BrowserClient, useFactory: () => browserClient, deps: []),
    provide(CarManager, useFactory: () => new CarManager(browserClient), deps: []),
    provide(ClassificationManager, useFactory: () => new ClassificationManager(browserClient), deps: [])
  ]);
}