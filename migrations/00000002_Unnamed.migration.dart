import 'package:aqueduct/aqueduct.dart';
import 'dart:async';

class Migration2 extends Migration {
  Future upgrade() async {
    database.createTable(new SchemaTable("_Car", [
      new SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),
    ]));

    database.createTable(new SchemaTable("_Classification", [
      new SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),
      new SchemaColumn("title", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),
      new SchemaColumn("description", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),
      new SchemaColumn.relationship("car", ManagedPropertyType.bigInteger, relatedTableName: "_Car", relatedColumnName: "id", rule: ManagedRelationshipDeleteRule.nullify, isNullable: true, isUnique: true),
    ]));

  }

  Future downgrade() async {
  }
  Future seed() async {
  }
}
