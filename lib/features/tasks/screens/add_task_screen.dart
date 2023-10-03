import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/tasks.dart';
import '../../../services/guid_gen.dart';
import '../bloc/tasks_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titileController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 24,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titileController,
              cursorColor: Colors.orange[500],
              decoration: InputDecoration(
                label: Text(
                  'Title',
                  style: TextStyle(color: Colors.orange[500]),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange[500]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange[500]!,
                  ),
                ),
              ),
            ),
          ),
          TextField(
            autofocus: true,
            controller: descriptionController,
            cursorColor: Colors.orange[500],
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              label: Text(
                'Description',
                style: TextStyle(color: Colors.orange[500]),
              ),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange[500]!,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange[500]!,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.orange[500],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  var task = Task(
                    title: titileController.text,
                    description: descriptionController.text,
                    id: GUIDGen.generate(),
                    date: DateTime.now().toString(),
                  );
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[500],
                ),
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
