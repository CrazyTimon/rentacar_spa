import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:rentacar_spa/client/models/car.dart';
import 'package:rentacar_spa/client/models/classification.dart';
import 'package:rentacar_spa/client/models/gearbox.dart';
import 'package:rentacar_spa/client/services/managers/cars.dart';
import 'package:rentacar_spa/client/services/managers/classification.dart';
import 'package:rentacar_spa/client/services/managers/gearbox.dart';


@Component(
  selector: 'left-menu',
  templateUrl: 'left_menu.html',
  directives: const [
    MaterialListComponent,
    MaterialListItemComponent,
    MaterialTreeComponent,
    MaterialExpansionPanel,
    MaterialExpansionPanelSet,
    ROUTER_DIRECTIVES,
    CORE_DIRECTIVES
  ],
  styleUrls: const [
    'left_menu.css',
  ],
  providers: const [
    popupBindings
  ]
)
class LeftMenu {
  bool end = false;
// Future<Null> gotoDetail() => _router.navigate([
//       'HeroDetail',
//       {'id': selectedHero.id.toString()}
//     ]);
  CarManager _carManager;
  ClassificationManager _clsManager;
  GearboxManager _gearboxManager;
  List<Car> cars = [];
  List<Classification> clss = [];
  List<Gearbox> gearBoxes = [];

  void anytest(dynamic davent) {
    print(davent);
  }

  final NestedSelectionOptions nestedOptions = new NestedSelectionOptions([
    new OptionGroup(
        [
          'Cars',
          'Gears',
          'Classification'
        ])
    ], {
    // 'Cars': [
    //   new OptionGroup([
    //     'Cinderalla',
    //     'Alice In Wonderland',
    //     'Peter Pan',
    //     'Lady and the Tramp',
    //   ])
    // ],
    // 'Live-Action Films': [
    //   new OptionGroup(
    //       ['Treasure Island', 'The Littlest Outlaw', 'Old Yeller', 'Star Wars'])
    // ],
    // 'Documentary Films': [
    //   new OptionGroup(['Frank and Ollie', 'Sacred Planet'])
    // ],
    // 'Star Wars': [
    //   new OptionGroup(['By George Lucas'])
    // ],
    // 'By George Lucas': [
    //   new OptionGroup(
    //       ['A New Hope', 'Empire Strikes Back', 'Return of the Jedi'])
    // ]
  });

  final SelectionModel singleSelection = new SelectionModel.withList();
  final ChangeDetectorRef _changeDetector;

  LeftMenu(
    this._changeDetector,
    this._carManager,
    this._clsManager,
    this._gearboxManager
  ) {
    _init();
  }
  Future _init() async {
    await _fetch();
    _generateList();
  }

  Future _fetch() async {
    cars = await _carManager.getAll();
    clss = await _clsManager.getAll(true);
    gearBoxes = await _gearboxManager.getAll(true);
  }

  void _generateList() {
    _generateCarTitles();
    _generateGearboxTitles();
    _generateClsTitles();
  }

  void _generateCarTitles() {
    List<String> carTitles = cars.map((Car _c)=>_c.title).toList();
    nestedOptions.children['Cars'] = [
      new OptionGroup(carTitles)
    ];
  }

  void _generateGearboxTitles() {
    List<String> gearboxTitles = gearBoxes.map((Gearbox _c)=>_c.title).toList();
    nestedOptions.children['Gears'] = [
      new OptionGroup(gearboxTitles)
    ];
  }

  void _generateClsTitles() {
    List<String> clsTitles = clss.map((Classification _c)=>_c.title).toList();
    nestedOptions.children['Classification'] = [
      new OptionGroup(clsTitles)
    ];
  }

  @ViewChild(MaterialTreeComponent)
  MaterialTreeComponent materialTree;

  bool _expandAll = false;
  bool get expandAll => _expandAll;
  set expandAll(bool value) {
    _expandAll = value;
    _changeDetector.markForCheck();
  }

  String get selection =>
      singleSelection.isEmpty ? '' : singleSelection.selectedValues.first;
}

/// An example implementation of [SelectionOptions] with [Parent].
class
  NestedSelectionOptions<T>
extends
  SelectionOptions<T>
implements
  Parent<
    T, List<OptionGroup<T>>
> {
  final Map<T, List<OptionGroup<T>>> children;

  NestedSelectionOptions(List<OptionGroup<T>> options, this.children)
      : super(options);

  @override
  bool hasChildren(T item) => children.containsKey(item);

  @override
  DisposableFuture<List<OptionGroup<T>>> childrenOf(T parent, [_]) {
    return new DisposableFuture<List<OptionGroup<T>>>.fromValue(
        children[parent]);
  }

  void cick(dynamic event) {
    print('$event');
  }
}