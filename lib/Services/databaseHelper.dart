import 'package:loter/Models/main_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperMain{
  static const int _version = 1;
  static const String _dbName = "MainDB.db";

  static Future<Database> _getDB() async{
    return openDatabase(join(await getDatabasesPath(), _dbName),
    onCreate: (db, version) async => 
    await db.execute("CREATE TABLE mainTable(id INTEGER PRIMARY KEY, Name TEXT NOT NULL, UserType TEXT NOT NULL, Email TEXT NOT NULL, Password TEXT NOT NULL, About TEXT )"),
    version: _version
    );
  }

  static Future<int> addMainDB(MainDB mainDB) async{
    final db = await _getDB();
    return await db.insert("MainDB", mainDB.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateMainDB(MainDB mainDB) async{
    final db = await _getDB();
    return await db.update("MainDB", mainDB.toJson(),
    where: 'id = ?',
    whereArgs: [mainDB.id],
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteMainDB(MainDB mainDB) async{
    final db = await _getDB();
    return await db.delete("MainDB", 
    where: 'id = ?',
    whereArgs: [mainDB.id],
    );
  }

  static Future<List<MainDB>?> getAllMainDB(MainDB mainDB) async{
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("MainDB");

    if(maps.isEmpty)
    {
      return null;
    }
    
    return List.generate(maps.length, (index) => MainDB.fromJson(maps[index]));
  }

}
