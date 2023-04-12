import 'package:flutter/material.dart';
import 'package:hive_todo/main.dart';
import 'package:hive_todo/todo_model.dart';

class HiveHelper{

  /// add new item
  static Future<void> add(TodoModel todoModel) async {
    await box.add(todoModel);
  }

  /// Get all items from the database
  static Future<List<TodoModel>> getItems() async {
    final data = box.keys.map((key) {
      TodoModel value = box.get(key);
      /// assign id to every item
      value.id=key;
      return value;
    }).toList();
      return  data.reversed.toList(); /// we use "reversed" to sort items in order from the latest to the oldest
  }

  /// get single item
  static TodoModel getItem( key) {
    final item = box.get(key);
    return item;
  }

  /// Update a single item
  static Future<void> updateItem(TodoModel todoModel) async {
    await box.put(todoModel.id, todoModel);
  }

  /// Delete a single item
  static Future<void> deleteItem(context,id) async {
    await box.delete(id);
    Navigator.of(context).pop();
    /// Display a snackBar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Delete Successful')));
  }

}