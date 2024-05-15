

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:test_floor/database/note_database.dart';
import 'home/presentation/home.dart';

void main()async{
  runApp(ProviderScope(child: MyApp()));
  
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<NoteDatabase>(
        future:$FloorNoteDatabase.databaseBuilder('note.db').build() ,
       builder: (context, data){
        if(data.hasData){
          Get.put(data.data!.noteDao);
          return HomePage();
        }
        else if(data.hasError){
          return const Text("error");
        }
        else{
          return const Text('Loading...');
        }
       }),
    );
  }
}
