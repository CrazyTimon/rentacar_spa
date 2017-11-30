import 'package:rentacar_spa/interfaces/entity.dart';

abstract class ClientEntity extends Entity {

  Map<String, dynamic> get addRequestParams;

  Map<String, dynamic> get updateRequestParams;

  List<EntityField> get fields;
}

class EntityWithTitle {
  String title;
}

class EntityField {
  String name;
  bool isEditable;
  EntityFieldsType type;
  //возможно лишнее, т.к. филд не может содержать значения кмк
  EntityFieldValue value;

  EntityField(this.name, this.isEditable, this.type, [this.value]);
}

enum EntityFieldsType {
  dorpdown,
  singleValue,
  link
}

abstract class EntityFieldValue {}

class StringEntityFieldValue implements EntityFieldValue {
  StringEntityFieldValue(this.value);
  String value;
}

class IntEntityFieldValue implements EntityFieldValue {
  IntEntityFieldValue(this.value);
  int value;
}

class EntityFieldLinkValue implements EntityFieldValue {
  EntityFieldLinkValue(this.value, this.entity);
  Type entity;
  //todo похоже на то что название не соответствует действительности, т.к. это по сути id сущности которая содержит списки значений
  int value;
}