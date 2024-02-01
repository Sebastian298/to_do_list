import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const _ListTileScreen();
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      )),
    );
  }
}

class _ListTileScreen extends StatelessWidget {
  const _ListTileScreen();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: const Column(children: [
        _LisTileStruct(),
        SizedBox(
          height: 7,
        ),
      ]),
    );
  }
}

class _LisTileStruct extends StatelessWidget {
  const _LisTileStruct();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: const Text(
        'Title',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: const _SubTitleStruct(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      leading: const Icon(
        Icons.radio_button_unchecked,
        color: Colors.green,
      ),
      trailing: const _TrailingStruct(),
    );
  }
}

class _SubTitleStruct extends StatelessWidget {
  const _SubTitleStruct();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Date',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _TrailingStruct extends StatelessWidget {
  const _TrailingStruct();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.edit,
          color: Colors.blue,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ],
    );
  }
}
