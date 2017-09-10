import 'package:aqueduct/aqueduct.dart';
import 'dart:async';

class Migration6 extends Migration {
  Future upgrade() async {
    database.addColumn("_Car", new SchemaColumn.relationship("classification", ManagedPropertyType.bigInteger, relatedTableName: "_Classification", relatedColumnName: "id", rule: ManagedRelationshipDeleteRule.nullify, isNullable: true, isUnique: true));

    database.deleteColumn("_Classification", "car");

  }

  Future downgrade() async {
  }
  Future seed() async {
  }
}
