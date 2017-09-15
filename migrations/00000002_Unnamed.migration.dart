import 'package:aqueduct/aqueduct.dart';   
import 'dart:async';

class Migration2 extends Migration { 
  Future upgrade() async {
   database.deleteColumn("_Car", "test");


  }
  
  Future downgrade() async {}
  Future seed() async {}
}
    