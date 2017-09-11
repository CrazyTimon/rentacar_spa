class DataManger<T> {
  final CarService _api;

  CarManager(this._api);

  List<ICar> _cars = [];

  List<ICar> get cars => _cars;

  Future getAll() => _api.getAll();

  Future add(ICar car) => _api.add(car);

  Future delete(ICar car) => _api.delete(car);

  Future update(ICar car) => _api.update(car);
}