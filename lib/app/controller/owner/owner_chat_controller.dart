import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OwnerChatDataBase {
  var fixedDatabase;
  var dbPath;
  var path;

  Future<Database> get fixed_database async {
    if (fixedDatabase != null) return fixedDatabase;

    fixedDatabase = openDatabase(
      join(await getDatabasesPath(), 'fixed_database.db'),
      onCreate: (db, version) => createTable(db),
      version: 1,
    );
    return fixedDatabase;
  }

  void createTable(Database db) {}
}
