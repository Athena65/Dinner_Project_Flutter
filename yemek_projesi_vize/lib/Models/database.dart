import 'package:sqflite/sqflite.dart';
import 'package:yemek_projesi_vize/Models/bigcontainersqflite.dart';

class MealBigDatabase {
  static final MealBigDatabase instance = MealBigDatabase._init();
  static Database? _database;
  MealBigDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('meal.db');
    return _database!;
  }

  //yeni database olusturmaya yarayan fonksiyon
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //veri tabani olusturma fonksiyonu
  Future _createDB(Database db, int version) async {
    final idType =
        'INTEGER PRIMARY KEY AUTOINCREMENT'; //otomatik artan integer identity
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';

    await db.execute('''
  CREATE TABLE MealBigDatabase(
  id $idType,
  name $textType,
  ratting $textType,
  time $textType,
  image $textType,
  )
  ''');
  }

//tabloya veri ekleme
  Future<int> create(BigMeal info) async {
    final db = await instance.database;
    final id = await db.insert('MealBigDatabase', info.toMap());
    return id;
  }

//tum verileri goruntuleme
  Future<BigMeal> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'MealBigDatabase',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return BigMeal.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found!');
    }
  }

  Future<List<BigMeal>> readAll() async {
    final db = await instance.database;
    const orderBy = 'ratting DESC';
    final result = await db.query('MealBigDatabase', orderBy: orderBy);
    return result.map((json) => BigMeal.fromMap(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'MealBigDatabase',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(BigMeal meal) async {
    final db = await instance.database;
    return db.update(
      'MealBigDatabase',
      meal.toMap(),
      where: 'id = ?',
      whereArgs: [meal.id],
    );
  }
}
