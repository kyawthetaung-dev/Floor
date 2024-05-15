
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../database/note_table.dart';
import '../infrastructure/home_remote_service.dart';

part 'home_notifier.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
   factory HomeState.initial() = _Initial;
   factory HomeState.loading() =_Loading;
   factory HomeState.noConnection() = _NoConnection;
   factory HomeState.empty() = _Empty;
   factory HomeState.success(List<Note> note) = _Success;
   factory HomeState.error(error) = _Error;
}

class HomeNotifier extends StateNotifier<HomeState>{
  final HomeRemoteService _homeRemoteService;
  HomeNotifier(this._homeRemoteService) :super(HomeState.initial());

  Future<void> fetchNote()async{
    state = HomeState.loading();
    var result = await _homeRemoteService.fetchNotes();
    state = result.fold(
      (l) => HomeState.error(l), 
      (r) => r.when(
        noConnection: HomeState.noConnection, 
        result: (data) =>data.isEmpty
        ? HomeState.empty():HomeState.success(data)
        )
      );
  }
  Future<void> deleteNote(String id)async{
    state = HomeState.loading();
    var result = await _homeRemoteService.deleteNote(id);
    state = result.fold(
      (l) => HomeState.error(l), 
      (r) => r.when(
        noConnection: HomeState.noConnection, 
        result: (data) =>data.isEmpty
        ? HomeState.empty():HomeState.success(data)
        )
      );
  }

Future<void> updateNote(String id, Note newNote) async {
  try {
    state = HomeState.loading(); 

    var result = await _homeRemoteService.updateNote(id,newNote);

    state = result.fold(
      (l) => HomeState.error(l),
      (r) =>r.when(
        noConnection: HomeState.noConnection, 
        result: (data)=>data.isEmpty? HomeState.empty():HomeState.success(data)
        )
    );
  } catch (error) {
    state = HomeState.error('Error: $error'); 
  }
}


}