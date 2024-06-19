import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage_practise/models/storage_item.dart';

import '../core/services/storage_service.dart';

class StorageServiceImpl implements StorageService {
  final _secureStorage = const FlutterSecureStorage();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Future<bool> containsKeyInSecureData({required String key}) async {
    debugPrint("Checking data for the key $key");
    var containsKey = await _secureStorage.containsKey(
        key: key, aOptions: _getAndroidOptions());
    return containsKey;
  }

  @override
  Future<void> deleteAllSecureData() async {
    debugPrint("Deleting all secured data");
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }

  @override
  Future<void> deleteSecureData({required StorageItem item}) async {
    debugPrint("Deleting data having key ${item.key}");
    await _secureStorage.delete(key: item.key, aOptions: _getAndroidOptions());
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<List<StorageItem>> readAllSecureData() async {
    debugPrint("Reading all secured data");
    var allData = await _secureStorage.readAll(aOptions: _getAndroidOptions());
    List<StorageItem> list =
        allData.entries.map((e) => StorageItem(e.key, e.value)).toList();
    return list;
  }

  @override
  Future<String?> readSecureData({required String key}) async {
    debugPrint("Reading data having key $key");
    var readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  @override
  Future<void> writeSecureData({required StorageItem newItem}) async {
    debugPrint("Writing new data having key ${newItem.key}");
    await _secureStorage.write(
        key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  }
}
