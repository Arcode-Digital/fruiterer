import 'package:flutter/material.dart';
import 'package:fruiterer/model/apple.dart';
import 'package:fruiterer/product/home/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewmodel {
  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: const Text("Fruiterer")),
      body: ListView(children: items.map((e) => _appleCard(e)).toList()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => navigateAdd(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _appleCard(Apple e) => Card(
        margin: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Image.asset('assets/app_icon.png'),
          title: Text(e.color),
          subtitle: Text(e.taste),
          trailing: Text("${e.gram} gram"),
        ),
      );
}
