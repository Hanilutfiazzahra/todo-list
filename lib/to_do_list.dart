import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final Map<String, bool> _tasks = {};
  final _controller = TextEditingController();

  void _tambahTugas() {
    if (_controller.text.isEmpty) return;
    setState(() => _tasks[_controller.text] = false);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('To-Do List')),

      body: Column(
        children: [
          // Kolom input + tombol tambah
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Tulis tugas...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _tambahTugas(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _tambahTugas,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          // Daftar tugas, satu baris per tugas dengan checkbox
          Expanded(
            child: ListView(
              children: _tasks.keys.map((tugas) {
                return CheckboxListTile(
                  title: Text(tugas),
                  value: _tasks[tugas],
                  onChanged: (nilai) {
                    setState(() => _tasks[tugas] = nilai!);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
