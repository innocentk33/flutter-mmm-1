import 'package:flutter/material.dart';
import 'package:flutter_mmm/app.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Bars/Restaurants"),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            title: const Text("Désordre"),
            subtitle: const Text("18 Rue Georges Charpak \n35000 Rennes"),
            isThreeLine: true,
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed('details'),
          ),
          ListTile(
            title: const Text("Désordre 2"),
            subtitle: const Text("19 Rue Georges Charpak \n35000 Rennes"),
            isThreeLine: true,
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed('details'),
          )
        ],
      )
    );
  }
}
