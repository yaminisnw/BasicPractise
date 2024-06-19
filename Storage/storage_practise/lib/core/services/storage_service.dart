import '../../models/storage_item.dart';
import 'app_service.dart';

///contains the methods responsible for reading, writing, and deleting data from secured storage
abstract class StorageService extends AppService {
  Future<void> writeSecureData({required StorageItem newItem});

  Future<String?> readSecureData({required String key});

  Future<void> deleteSecureData({required StorageItem item});

  Future<List<StorageItem>> readAllSecureData();

  Future<void> deleteAllSecureData();

  Future<bool> containsKeyInSecureData({required String key});
}
