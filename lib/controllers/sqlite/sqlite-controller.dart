import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/chat-message.dart';
import '../persistence-controller.dart';

class SqliteController implements PersistenceController {
  static const String _tableName = 'chat_messages';
  static Database? _database;

  Future<void> _initDatabase() async {
    if (_database != null) return;

    String dbPath = join(await getDatabasesPath(), 'chat_messages.db');
    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, message TEXT, author TEXT, dateTime TEXT)',
        );
      },
    );
  }

  @override
  Future<List<ChatMessage>> getAllMessages() async {
    await _initDatabase();
    final List<Map<String, dynamic>> maps = (await _database!.query(_tableName));
    List<ChatMessage> msgs = List.generate(maps.length, (i) {
      return ChatMessage.fromJson({
        'message': maps[i]['message'],
        'author': maps[i]['author'],
        'dateTime': maps[i]['dateTime'],
      });
    });
    return msgs;
  }

  @override
  Future<void> saveMessage(ChatMessage message) async {
    await _initDatabase();
    await _database!.insert(
      _tableName,
      message.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
