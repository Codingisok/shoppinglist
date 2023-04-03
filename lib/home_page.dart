import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoppinglist/util/dialog_box.dart';
import 'package:shoppinglist/util/shopping_list_tile.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();
  
  //list of shoppings
  List shoppinglist = [
    ['praz', false],
    ['branza da Crasna', false],
  ];
  // checbox was tapped
  void checkBoxChanged (bool? value, int index) {
setState(() {
  shoppinglist[index][1] = !shoppinglist[index][1];
});
  }
  // save new task
  void saveNewTask(){
    setState(() {
      shoppinglist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

// create new task
void createNewTask() {
  showDialog(
    context: context, 
    builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    },
  );
}

// delete shoping list
void deleteTask (int index) {
 // log('deleteTask method is called');
  setState(() {
    shoppinglist.removeAt(index);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[444],
      appBar: AppBar(
          title: const Text('Lista cumparaturi'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: shoppinglist.length,
        itemBuilder: (context, index) {
          return ShoppingListTile(
            taskName: shoppinglist[index] [0], 
            taskCompleted: shoppinglist[index] [1],
            onChanged: (value) => checkBoxChanged(value, index), 
            deleteFunction: (context) => deleteTask,
            index:index,
            );
        }
         ,
      ),
    );
  }
}