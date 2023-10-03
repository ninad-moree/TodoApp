import 'package:flutter/material.dart';

import '../models/tasks.dart';

class PopUpMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopUpMenu({
    super.key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        if (task.isDeleted == false) {
          return [
            PopupMenuItem(
              onTap: null,
              child: TextButton.icon(
                onPressed: editTaskCallback,
                icon: Icon(Icons.edit, color: Colors.orange[900]),
                label: Text(
                  'Edit',
                  style: TextStyle(color: Colors.orange[900]),
                ),
              ),
            ),
            PopupMenuItem(
              onTap: likeOrDislikeCallback,
              child: TextButton.icon(
                onPressed: null,
                icon: task.isFavorite == false
                    ? Icon(Icons.bookmark_add_outlined,
                        color: Colors.orange[900])
                    : Icon(Icons.bookmark_remove, color: Colors.orange[900]),
                label: task.isFavorite == false
                    ? Text(
                        'Add to \nbookmark',
                        style: TextStyle(color: Colors.orange[900]),
                      )
                    : Text(
                        'Remove from \nbookmark',
                        style: TextStyle(color: Colors.orange[900]),
                      ),
              ),
            ),
            PopupMenuItem(
              onTap: cancelOrDeleteCallback,
              child: TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.delete,
                  color: Colors.orange[900],
                ),
                label: Text(
                  'Delete',
                  style: TextStyle(color: Colors.orange[900]),
                ),
              ),
            ),
          ];
        } else {
          return [
            PopupMenuItem(
              onTap: restoreTaskCallback,
              child: TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.restore_from_trash,
                  color: Colors.orange[900],
                ),
                label: Text(
                  'Restore',
                  style: TextStyle(color: Colors.orange[900]),
                ),
              ),
            ),
            PopupMenuItem(
              onTap: () => cancelOrDeleteCallback(),
              child: TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.orange[900],
                ),
                label: Text(
                  'Delete Forever',
                  style: TextStyle(color: Colors.orange[900]),
                ),
              ),
            ),
          ];
        }
      },
    );
  }
}
