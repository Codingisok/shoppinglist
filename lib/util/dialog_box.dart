import 'package:flutter/material.dart';
import 'package:shoppinglist/util/my_button.dart';

class DialogBox extends StatelessWidget {
final controller;
VoidCallback onSave;
VoidCallback onCancel;

 DialogBox({
  super.key, 
  required this.controller,
  required this.onSave,
  required this.onCancel,
  });
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.amberAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get user input
          TextField(
            controller:controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Adauga o noua cumparatura',
              ),
          ),

          // buttons save + cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              //save button
              MyButton(text: 'Salveaza', onPressed: onSave),
              const SizedBox(width: 8,),
              // cancel button
              MyButton(text: 'Anuleaza', onPressed: onCancel),
            ],
          )
        ],),
      ),
    );
  }
}