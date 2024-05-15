import 'package:floor/floor.dart';
import 'package:test_floor/database/note_dao.dart';
import 'package:test_floor/database/note_table.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase{
  NoteDao get noteDao;

  
}