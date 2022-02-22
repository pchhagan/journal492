import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'journal_entry_DAO.dart';
import 'journal_entry_DTO.dart';
import 'package:journal/models/journal_entry.dart';

class DatabaseManager {
  static String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SCHEMA_FILENAME = 'assests/schema_1.sql.txt';
  static const String SQL_INSERT ='INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries';

  static late DatabaseManager _instance;

  final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    final db = await openDatabase(DATABASE_FILENAME, version: 1,
        onCreate: (Database db, int version) async {
      final String SQL_CREATE_SCHEMA =
          await rootBundle.loadString(SCHEMA_FILENAME);
      createTables(db, SQL_CREATE_SCHEMA);
    });
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({required JournalEntryDTO dto}) {
    db.transaction((txn) async {
      await txn.rawInsert(SQL_INSERT,
          [dto.title, dto.body, dto.rating, dto.dateTime.toString()]);
    });
  }

  Future<List<Map<String, dynamic>>> journalEntries() {
    return db.rawQuery(SQL_SELECT);
  }
}
