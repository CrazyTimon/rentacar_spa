import 'package:aqueduct/aqueduct.dart';
import 'dart:async';

class Migration4 extends Migration {
  Future upgrade() async {
    database.alterColumn("_Car", "title", (c) {
      c.defaultValue = "''";
    });

  }

  Future downgrade() async {
  }
  Future seed() async {
  }
}
