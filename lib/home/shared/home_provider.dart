
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_floor/home/Application/application.dart';

import '../../common/shared/providers.dart';
import '../Application/save_home_notifier.dart';
import '../infrastructure/home_remote_service.dart';
final homeRemoteServiceProvider =
    Provider((ref) => HomeRemoteService(ref.watch(dioProvider)));

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(ref.watch(homeRemoteServiceProvider)),
);

final saveHomeNotifierProvider =
    StateNotifierProvider<SaveHomeNotifier, SaveHomeState>(
  (ref) => SaveHomeNotifier(ref.watch(homeRemoteServiceProvider)),
);

// Number_Change_Notifier
// class ContactChangeNotifier extends ChangeNotifier {
//   List<Contact> contacts = [];

//   void add(Contact number) {
//     contacts.add(number);
//     notifyListeners();
//   }

//   void addAll(List<Contact> list) {
//     contacts.clear();
//     contacts.addAll(list);
//     notifyListeners();
//   }

//   void clear() {
//     contacts = [];
//     notifyListeners();
//   }

//   void deleteByIndex(int index) {
//     contacts.removeAt(index);
//     notifyListeners();
//   }
// }

// number_Change_Notifier_Provider
// final homeListProvider =
//     ChangeNotifierProvider<HomeChangeNotifier>((ref) {
//   return HomeChangeNotifier();
// });
