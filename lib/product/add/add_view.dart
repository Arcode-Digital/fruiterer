import 'package:flutter/material.dart';
import 'package:fruiterer/product/add/add_viewmodel.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  AddViewmodel viewmodel = AddViewmodel();
  late TextEditingController _gramController;
  late String _color;
  late String _taste;

  @override
  void initState() {
    super.initState();
    _gramController = TextEditingController();
    _color = viewmodel.colorItems.first;
    _taste = viewmodel.tasteItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New")),
      body: Column(
        children: [
          _gramField,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectBox(viewmodel.colorItems, _color, (String val) => _color = val),
              selectBox(viewmodel.tasteItems, _taste, (String val) => _taste = val),
            ],
          ),
          button,
        ],
      ),
    );
  }

  Widget get _gramField {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: const InputDecoration(filled: true, border: OutlineInputBorder()),
        controller: _gramController,
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget get button {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () => viewmodel.add(context, color: _color, taste: _taste, gram: int.tryParse(_gramController.text)),
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width - 40.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const Center(child: Text("ADD")),
        ),
      ),
    );
  }

  Widget selectBox(List<String> items, String val, Function(String val) onSelect) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: DropdownButton(
        value: val,
        items: items.map<DropdownMenuItem>((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
        onChanged: (value) {
          if (value != null) setState(() => onSelect(value));
        },
      ),
    );
  }
}
