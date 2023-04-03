import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShoppingListTile extends StatelessWidget {
  final int index;
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function (BuildContext)? deleteFunction;

ShoppingListTile({
  super.key, 
  required this.index,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              )
          ]
        ),
        child: Container(
          padding: const EdgeInsets.all(19),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12)
            ),
          child: Row(
            children: [
      
              // checkbox
             Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.black,
              ),
              
              // task name
              
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted 
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),)
            ],
          ),
        ),
      ),
    );
  }
}
