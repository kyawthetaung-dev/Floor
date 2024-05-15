import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_floor/database/note_dao.dart';

class AddPage extends StatefulWidget {
  AddPage({super.key});
final NoteDao noteDao = Get.find();
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController secondNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setData();
  }
  Future<void> setData() async {
    
  }
  @override
  Widget build(BuildContext context) {
     
    Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Page"),
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
              // noteDao.addNote(Note(firstNameController.text, secondNameController.text, ));
              Get.back();
            }, child: const Text("Add Note"))
          ],
        ),
      ),
    );
  }
}
