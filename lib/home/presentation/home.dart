
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_floor/database/note_dao.dart';
import 'package:test_floor/database/note_table.dart';
import 'package:test_floor/home/Application/home_notifier.dart';
import 'package:test_floor/home/presentation/add.dart';
import 'package:test_floor/home/shared/home_provider.dart';
import 'package:test_floor/home/widget/home_list.dart';
import '../../database/note_database.dart';
import '../infrastructure/home_remote_service.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Note> notesList = [];
  @override
  void initState() {
    super.initState();
    getNotes();
  }

  Future<void> getNotes() async {
    Future.microtask(() async {
        ref.read(saveHomeNotifierProvider.notifier).getNotes();

      final database =
          await $FloorNoteDatabase.databaseBuilder('note.db').build();
      HomeRemoteService service = HomeRemoteService(Dio());
      final NoteDao = database.noteDao;
      var notes = await service.getNotes();
      
      // notes.fold((l) => notesList = [], (r) => r.when(noConnection: (){}, result: (data){
       
      // }));
         notesList = notes;
     await NoteDao.insertAllNote(notesList);

    });
    
    
  }
  final NoteDao noteDao = Get.find();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController secondNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Floor')),
      ),
      body: const HomeListWidget(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.to(AddPage());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              noteDao.deleteAllNote(notesList);
            },
            child: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
  }
