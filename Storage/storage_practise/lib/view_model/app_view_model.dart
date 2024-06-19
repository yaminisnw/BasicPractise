import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import '../core/services/storage_service.dart';
import '../core/view_model/view_model.dart';
import '../data/repository.dart';
import '../models/app_state.dart';
import '../provider/app_state_notifier.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key, this.child, required this.repo})
      : super(key: key);

  final Widget? child;
  final AppRepository repo;

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<AppViewModel, AppState>(
      create: (_) => AppViewModel(repo),
      child: child,
    );
  }
}

class AppViewModel extends AppStateNotifier<AppState>
    with LocatorMixin
    implements AppBaseViewModel {
  AppViewModel(this._repo) : super(AppState());
  final AppRepository _repo;
  StorageService get _storageService => _repo.storageService;

  @override
  Future<void> init() async {}
  // Future<void> writeSecureData(StorageItem newItem) async{
  //   state = state.rebuild((AppStateBuilder b) => b.newItem = newItem);
  //   await _storageService.writeSecureData(newItem: newItem);
  // }
}
