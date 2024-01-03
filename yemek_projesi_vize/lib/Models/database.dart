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
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE MealBigDatabase (
      id $idType,
      name $textType,
      ratting $textType,
      time $textType,
      image $textType
      )
      ''');
    //veri ekleme
    await db.insert(
        'MealBigDatabase',
        {
          'name': "Sokak Döner",
          'ratting': " 3/5 İyi (50)",
          'time': " 35-40 dakika",
          'image': "https://images.deliveryhero.io/image/fd-tr/LH/c9ay-hero.jpg"
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    await db.insert(
        'MealBigDatabase',
        {
          'name': "Ortaköy Kumpir",
          'ratting': " 4/5 Çok İyi (65)",
          'time': " 20-40 dakika",
          'image':
              "https://tarifpaylasimlari.com/wp-content/uploads/2019/02/kumpir-1.jpg"
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    await db.insert(
        'MealBigDatabase',
        {
          'name': "Çiğköfte Evreni",
          'ratting': " 5/5 Süper (103)",
          'time': " 10-20 dakika",
          'image':
              "https://cdn.yemek.com/mnresize/1250/833/uploads/2022/01/etsiz-cig-kofte-fatma.jpg"
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    await db.insert(
        'MealBigDatabase',
        {
          'name': "Pitza",
          'ratting': " 2/5 Normal (202)",
          'time': " 35-50 dakika",
          'image':
              "https://cdn.loveandlemons.com/wp-content/uploads/2023/02/vegetarian-pizza.jpg"
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//tabloya veri ekleme
  Future<int> create(BigMeal info, int selectedItemId) async {
    final db = await instance.database;
    final id = await db.insert('MealBigDatabase', info.toMap());
    await db.insert('SelectedItems', {'selectedItemId': selectedItemId}, conflictAlgorithm: ConflictAlgorithm.replace);
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
