
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_floor/database/note_dao.dart';
import 'package:test_floor/database/note_table.dart';

import '../shared/home_provider.dart';

class UpdatePage extends ConsumerStatefulWidget {
  UpdatePage({super.key});
final NoteDao noteDao = Get.find();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdatePageState();
}

class _UpdatePageState extends ConsumerState<UpdatePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
     
    final NoteDao noteDao = Get.find();
    Note note = Get.arguments;
    firstNameController.text = note.title;
    secondNameController.text = note.message;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: 'Enter title',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: secondNameController,
              decoration: const InputDecoration(
                  hintText: 'Enter message', 
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
              noteDao.updateNote(Note(note.id, firstNameController.text, secondNameController.text));
              ref.read(saveHomeNotifierProvider.notifier).updateNote(Note(note.id, firstNameController.text, secondNameController.text));
              Get.back();
            }, child: const Text("Update Note"))
          ],
        ),
      ),
    );
  }
}
