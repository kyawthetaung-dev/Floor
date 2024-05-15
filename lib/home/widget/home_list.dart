
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_floor/home/presentation/update.dart';
import 'package:test_floor/home/shared/home_provider.dart';

import '../../database/note_dao.dart';
import '../../database/note_table.dart';

class HomeListWidget extends ConsumerStatefulWidget {
  const HomeListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends ConsumerState<HomeListWidget> {
  List<Note> notesList = [];
  @override
  Widget build(BuildContext context) {
    
    final NoteDao noteDao = Get.find();
    return  StreamBuilder<List<Note>>(
      stream: noteDao.getAllNote(),
      builder: (_, data) {
        if (data.hasData) {
          notesList = data.data!;
          return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                    title: Text(notesList[index].title),
                    subtitle: Text(notesList[index].message),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              noteDao.deleteNote(data.data![index]);
                              ref
                                  .read(saveHomeNotifierProvider.notifier)
                                  .deleteNote(notesList[index].id);
                            },
                            icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              Get.to(UpdatePage(),
                                  arguments: data.data![index]);
                                 
                            },
                            icon: const Icon(Icons.edit))
                      ],
                    ),
                  ),
                );
              });
        } else if (data.hasError) {
          return const Text("error");
        } else {
          return const Text("Loading");
        }
      },
    );
  
  }
}