import 'package:cms/models/lang_status_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cms/models/lang_model.dart';

class HiveBox {
  static Future create() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LangsAdapter());
    Hive.registerAdapter(LangsStatusAdapter());
  }
}