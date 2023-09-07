import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'music.db';
  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async {
      db.execute('''
          CREATE TABLE playlists (
            id INTEGER PRIMARY KEY,
            name TEXT,
            isChecked INTEGER
          )
        ''');
      db.execute('''
          CREATE TABLE songs (
            id INTEGER PRIMARY KEY,
            playlistId INTEGER,
            songData TEXT
          )
        ''');
    }, version: _version);
  }
}
