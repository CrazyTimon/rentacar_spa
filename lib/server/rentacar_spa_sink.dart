
import 'package:rentacar_spa/server/controller/cars_controller.dart';
import 'package:rentacar_spa/server/controller/classification_controller.dart';
import 'package:rentacar_spa/server/controller/gearbox_controller.dart';
import 'package:rentacar_spa/server/controller/root_controller.dart';
import '../rentacar_spa.dart';
import 'package:rentacar_spa/urls.dart';

/// This class handles setting up this application.
///
/// Override methods from [RequestSink] to set up the resources your
/// application uses and the routes it exposes.
///
/// See the documentation in this file for [initializeApplication], [RentacarSpaSink], [setupRouter] and [willOpen]
/// for the purpose and order of the initialization methods.
///
/// Instances of this class are the type argument to [Application].
/// See http://aqueduct.io/docs/http/request_sink
/// for more details.
class RentacarSpaSink extends RequestSink {
  /**
   * Initialization methods
   */

  /// Constructor called for each isolate run by an [Application].
  ///
  /// This constructor is called for each isolate an [Application] creates to serve requests - therefore,
  /// any initialization that must occur only once per application startup should happen in [initializeApplication].
  ///
  /// This constructor is invoked after [initializeApplication] and is invoked once per isolate.
  ///
  /// The [appConfig] is made up of command line arguments from the script that starts the application and often
  /// contain values that [initializeApplication] adds to it.
  ///
  /// Configuration of database connections, [HTTPCodecRepository] and other per-isolate resources should be done in this constructor.
  RentacarSpaSink(ApplicationConfiguration appConfig) : super(appConfig){
    _initContext();
    // _initAuthServer();
  }

  // void _initAuthServer() {
  //   var storage = new ManagedAuthStorage<User>(context);
  //   authServer = new AuthServer(storage);
  // }

  _initContext() {
    var dataModel = new ManagedDataModel.fromCurrentMirrorSystem();
    var persistentStore = new PostgreSQLPersistentStore.fromConnectionInfo(
      "dart", "dart", "localhost", 5432, "rentacar_spa");
    context = new ManagedContext(dataModel, persistentStore);
  }

  AuthServer authServer;
  ManagedContext context;

  /// Do one-time application setup in this method.
  ///
  /// This method is executed before any instances of this type are created and is the first step in the initialization process.
  ///
  /// Values can be added to [appConfig]'s [ApplicationConfiguration.options] and will be available in each instance of this class
  /// in the constructor.
  static Future initializeApplication(ApplicationConfiguration appConfig) async {

  }

  /// All routes must be configured in this method.
  ///
  /// This method is invoked after the constructor and before [willOpen] Routes must be set up in this method, as
  /// the router gets 'compiled' after this method completes and routes cannot be added later.
  @override
  void setupRouter(Router router) {
    // Prefer to use `pipe` and `generate` instead of `listen`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      ..route("/example")
      .listen((request) async {
        return new Response.ok({"key": "value"});
      })
      ..route('$CARS[/:carId]')
      .generate(() => new CarsController())
      ..route('$CLASSIFICATIONS[/:classificationId]')
      .generate(() => new ClassificationController())
      ..route('$GEARBOXES[/:gearboxId]')
      .generate(() => new GearboxController());
      // ..route("/car/classifications")
      // .generate(() => new ClassificationsController());
      // ..route("/getcars")
      // .generate(() => new RootController())
      // ..route("/cars/create")
      // .generate(() => new CarController())
  }

  /// Final initialization method for this instance.
  ///
  /// This method allows any resources that require asynchronous initialization to complete their
  /// initialization process. This method is invoked after [setupRouter] and prior to this
  /// instance receiving any requests.
  @override
  Future willOpen() async {}
}