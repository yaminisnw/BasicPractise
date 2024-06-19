import 'package:flutter/material.dart';
import 'package:storage_practise/widgets/textfield_decoration.dart';

import '../models/storage_item.dart';

class EditDataDialog extends StatefulWidget {
  //TODO: Expect a StorageItem here
  final StorageItem item;
  const EditDataDialog({Key? key, required this.item}) : super(key: key);

  @override
  State<EditDataDialog> createState() => _EditDataDialogState();
}

class _EditDataDialogState extends State<EditDataDialog> {
  late TextEditingController _valueController;

  @override
  void initState() {
    super.initState();
    //TODO: Add the default text to the _valueController using the StorageItem
    _valueController = TextEditingController(text: widget.item.value);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _valueController,
              decoration: textFieldDecoration(hintText: "Enter Value"),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      //TODo: Return the updated value back to the vault VaultCard widget
                      Navigator.of(context).pop(_valueController.text);
                    },
                    child: const Text('Update')))
          ],
        ),
      ),
    );
  }
}
