import 'package:flutter/material.dart';

import '../models/tasks.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: tasksList
              .map(
                (task) => Container(
                  height: 100,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange[400]!),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange[200]!,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 7.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TaskTile(task: task), // Task properties here
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}


// return Expanded(
    //   child: SingleChildScrollView(
    //     child: ExpansionPanelList.radio(
    //       children: tasksList
    //           .map(
    //             (task) => ExpansionPanelRadio(
    //               value: task.id,
    //               headerBuilder: (context, isOpen) => TaskTile(task: task),
    //               body: ListTile(
    //                 title: SelectableText.rich(
    //                   TextSpan(
    //                     children: [
    //                       const TextSpan(
    //                         text: 'Text:\n',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       TextSpan(
    //                         text: task.title,
    //                         style: TextStyle(color: Colors.grey[500]),
    //                       ),
    //                       const TextSpan(
    //                         text: '\n\nDescription:\n',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       TextSpan(
    //                         text: task.description,
    //                         style: TextStyle(color: Colors.grey[500]),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           )
    //           .toList(),
    //     ),
    //   ),
    // );