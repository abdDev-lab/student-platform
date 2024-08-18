import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "progres.db");
    Database progresdb =
        await openDatabase(path, onCreate: _onCreate, version: 6);
    return progresdb;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
     CREATE TABLE 'schedules'(
      schedule_id INTEGER AUTO INCREMENT NOT NULL PRIMARY KEY , 
      teacher_lastname	TEXT  NOT NULL ,
      subject_name TEXT NOT NULL ,
      schedule_groupe	INTEGER NOT NULL ,
      schedule_classtype	TEXT NOT NULL ,
      schedule_class	INTEGER NOT NULL ,
      schedule_day	INTEGER NOT NULL ,
      schedule_from	TEXT NOT NULL ,
      schedule_to	TEXT NOT NULL ,
      schedule_year	TEXT NOT NULL ,
      schedule_card_color INTEGER NOT NULL  
      )
    ''');
    batch.execute('''
     CREATE TABLE 'tasks'(
      task_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      task_title TEXT NOT NULL,
      task_datetime TEXT NOT NULL,
      task_starttime TEXT NOT NULL,
      task_endtime TEXT NOT NULL,
      task_color INTEGER NOT NULL,
      task_do INTEGER NOT NULL
      )
    ''');
    batch.commit();
    print("Create DataBase");
  }

  readData(String table, String where) async {
    Database? appdb = await db;
    List<Map> response = await appdb!.query(table, where: where);
    return response;
  }

  insertData(String table, values) async {
    Database? appdb = await db;
    int response = await appdb!.insert(table, values);
    return response;
  }

  updateData(String sql) async {
    Database? appdb = await db;
    int response = await appdb!.rawUpdate(sql);
    return response;
  }

  deleteData(String table) async {
    Database? appdb = await db;
    int response = await appdb!.delete(table);
    return response;
  }
}
