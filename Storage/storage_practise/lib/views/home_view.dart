import 'package:flutter/material.dart';
import 'package:storage_practise/widgets/add_data_dialog.dart';
import 'package:storage_practise/widgets/search_key_value_dialog.dart';

import '../core/services/local_storage_services.dart';
import '../models/storage_item.dart';
import '../widgets/vault_card.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TODO: Initialize the StorageService instance
  late List<StorageItem> _items;
  bool _loading = true;
  final LocalStorageServices _localStorageService = LocalStorageServices();

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() async {
    _items = await _localStorageService
        .readAllSecureData(); //TODO: Use the readAll method here to update the list
    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () => showDialog(
                  context: context,
                  builder: (_) => const SearchKeyValueDialog())
              //TODO: Use the SearchKeyValueDialog widget to read data according to the key
              )
        ],
      ),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : _items.isEmpty
                ? const Text("Add data in secure storage to display here.")
                : ListView.builder(
                    itemCount: _items.length,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (_, index) {
                      //TODO: Use Dismissible Widget to delete a particular key-pair using the deleteSecureData method
                      return Dismissible(
                        key: Key(_items[index].toString()),
                        child: VaultCard(item: _items[index]),
                        onDismissed: (direction) async {
                          await _localStorageService
                              .deleteSecureData(_items[index])
                              .then((value) => _items.removeAt(index));
                          initList();
                        },
                      );
                    }),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.white),
                  onPressed: () async {
                    //TODO: Utilize the AddDataDialog widget to get the new item and use the writeSecureData method to write new data in secure storage
                    final StorageItem? newItem = await showDialog<StorageItem>(
                        context: context, builder: (_) => AddDataDialog());
                    if (newItem != null) {
                      _localStorageService
                          .writeSecureData(newItem)
                          .then((value) {
                        setState(() {
                          _loading = true;
                        });
                        initList();
                      });
                    }
                  },
                  child: const Text("Add Data"),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  onPressed: () async {
                    //TODO: To delete all the data from the secure storage use the deleteAllSecureData method
                    _localStorageService
                        .deleteAllSecureData()
                        .then((value) => initList());
                  },
                  child: const Text("Delete All"),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
