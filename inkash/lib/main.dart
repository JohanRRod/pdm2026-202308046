import 'package:flutter/material.dart';

import 'app.dart';
import 'database/db_helper.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

 
  await DBHelper.database;

  runApp(const MyApp());
}