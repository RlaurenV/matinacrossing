import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');

    // Create the database and return the instance
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Create tables and define the schema here
        db.execute('''
          CREATE TABLE residents(
            id INTEGER PRIMARY KEY,
            firstName TEXT,
            lastName TEXT,
            address TEXT,
            status TEXT
          )
        ''');
      },
    );
  }
}
