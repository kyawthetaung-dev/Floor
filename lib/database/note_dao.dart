import 'package:floor/floor.dart';
import 'package:test_floor/database/note_table.dart';

@dao
abstract class NoteDao{
  @Query('select * from note')
  Stream<List<Note>> getAllNote();

  @insert
  Future<void> addNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteAllNote(List<Note> noteList);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNote(Note note);

  @Query('select * from note')
  Future<List<Note>> findAllNote();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllNote(List<Note> notes);
 }