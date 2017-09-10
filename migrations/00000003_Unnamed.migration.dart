import 'package:aqueduct/aqueduct.dart';
import 'dart:async';

class Migration3 extends Migration {
  Future upgrade() async {
    database.addColumn("_Car", new SchemaColumn("title", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, defaultValue: "", isIndexed: false, isNullable: false, isUnique: false));

  }

  Future downgrade() async {
  }
  Future seed() async {
  }
}
