import 'package:storage_practise/core/services/storage_service.dart';
import 'package:storage_practise/data/storage_service_impl.dart';

import '../core/services/notification_service.dart';
import 'notification_service_impl.dart';

class AppRepository {
  late final NotificationService notificationService;
  final StorageService storageService = StorageServiceImpl();

  Future<void> init() async {
    notificationService = NotificationServiceImpl();
  }
}
