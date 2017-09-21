import 'package:aqueduct/aqueduct.dart';   
import 'dart:async';

class Migration3 extends Migration { 
  Future upgrade() async {
   database.createTable(new SchemaTable("_Gearbox", [
new SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),
new SchemaColumn("title", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),
],
));

database.addColumn("_Car", new SchemaColumn.relationship("gearbox", ManagedPropertyType.bigInteger, relatedTableName: "_Gearbox", relatedColumnName: "id", rule: ManagedRelationshipDeleteRule.nullify, isNullable: true, isUnique: false));



  }
  
  Future downgrade() async {}
  Future seed() async {}
}
    