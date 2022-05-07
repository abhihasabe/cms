import 'package:cms/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;
  final String title;

  const MultiSelect({Key? key, required this.items, required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class ListData {
  int? items;
  String? name;

  ListData({this.items, this.name});

  @override
  String toString() {
    return '{ ${this.items}, ${this.name} }';
  }
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<ListData> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(int itemValue, String value, bool isSelected) {
    setState(() {
      if (isSelected) {
        for (int i = 0; i < itemValue.toString().length; i++) {
          _selectedItems.add(ListData(items: itemValue + 1, name: value));
        }
      } else {
        _selectedItems.removeWhere((itemValue) {
          return itemValue.name!.contains(value);
        });
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  List<bool>? isChecked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isChecked = List.generate(widget.items.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.centerRight,
      title: Text(widget.title),
      content: SingleChildScrollView(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Checkbox(
                  value: isChecked![index],
                  onChanged: (checked) {
                    setState(
                      () {
                        isChecked![index] = checked!;
                        _itemChange(index, widget.items[index], checked);
                      },
                    );
                  },
                ),
                title: Text(
                  widget.items[index],
                  style: const TextStyle(color: textColor, fontSize: 16),
                ),
              );
            }),
      )),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
