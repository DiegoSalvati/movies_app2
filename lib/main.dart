import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/src/models/item_model.dart';
import 'src/app.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ItemModelAdapter());
  Hive.registerAdapter(ResultAdapter());


  runApp(App());
}

