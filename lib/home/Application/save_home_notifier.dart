import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/domain/response_info_error.dart';
import '../../database/note_table.dart';
import '../infrastructure/home_remote_service.dart';
import 'home_notifier.dart';

part 'save_home_notifier.freezed.dart';

@freezed
abstract class SaveHomeState with _$SaveHomeState {
   factory SaveHomeState.initial() = _Initial;
   factory SaveHomeState.loading() = _Loading;
   factory SaveHomeState.noConnection() = _NoConnection;
   factory SaveHomeState.empty()=_Empty;
   factory SaveHomeState.error(ResponseInfoError error) = _Error;
   factory SaveHomeState.success(String success) = _Success;
 }
 
class SaveHomeNotifier extends StateNotifier<SaveHomeState> {
  final HomeRemoteService _remoteService;
  SaveHomeNotifier(this._remoteService)
      : super(SaveHomeState.initial());


  Future<void> deleteNote(String id) async {
    state = SaveHomeState.loading();
    final result = await _remoteService.deleteNote(id);
    state = result.fold(
      (l) => SaveHomeState.error(l),
      (r) => r.when(
        noConnection: SaveHomeState.noConnection,
        result: (data) => SaveHomeState.success(data),
      ),
    );
  }
  //  Future<void> addPlayer(String name) async {
  //   state = SaveHomeState.loading();
  //   final result = await _remoteService.addPlayer(name);
  //   state = result.fold(
  //     (l) => SaveHomeState.error(l),
  //     (r) => r.when(
  //       noConnection: SaveHomeState.noConnection,
  //       result: (data) => SaveHomeState.success(data),
  //     ),
  //   );
  // }

  Future<void> getNotes()async{
    state = SaveHomeState.loading();
    var result = await _remoteService.fetchNotes();
    state = result.fold(
      (l) => SaveHomeState.error(l), 
      (r) => r.when(
        noConnection: SaveHomeState.noConnection, 
        result: (data) =>data.isEmpty
        ? SaveHomeState.empty():SaveHomeState.success(data)
        )
      );
  }
  Future<void> updateNote(Note note) async {
    state = SaveHomeState.loading();
    final result = await _remoteService.updateNote(note.id, note);
    state = result.fold(
      (l) => SaveHomeState.error(l),
      (r) => r.when(
        noConnection: SaveHomeState.noConnection,
        result: (data) => SaveHomeState.success(data),
      ),
    );
  }
}
