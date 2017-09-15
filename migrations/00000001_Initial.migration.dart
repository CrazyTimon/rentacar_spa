import 'package:aqueduct/aqueduct.dart';   
import 'dart:async';

class Migration1 extends Migration { 
  Future upgrade() async {
   database.createTable(new SchemaTable("_Classification", [
new SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),
new SchemaColumn("title", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),
new SchemaColumn("description", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),
],
));

database.createTable(new SchemaTable("_Car", [
new SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),
new SchemaColumn("test", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),
new SchemaColumn("title", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, defaultValue: "''", isIndexed: false, isNullable: false, isUnique: false),
new SchemaColumn.relationship("classification", ManagedPropertyType.bigInteger, relatedTableName: "_Classification", relatedColumnName: "id", rule: ManagedRelationshipDeleteRule.nullify, isNullable: true, isUnique: false),
],
));


  }
  
  Future downgrade() async {}
  Future seed() async {}
}
    