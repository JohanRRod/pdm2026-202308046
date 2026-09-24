import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'inkash.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE categoria (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            icono TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE movimiento (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            categoria_id INTEGER NOT NULL,
            titulo TEXT NOT NULL,
            monto DECIMAL(10,2) NOT NULL,
            tipo TEXT NOT NULL,
            fecha TEXT NOT NULL,
            metodo_pago TEXT,
            FOREIGN KEY (categoria_id) REFERENCES categoria(id)
          )
        ''');
      },
    );
  }
}