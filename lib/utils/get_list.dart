import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/model/todo.dart';

Future<List<ToDo>> getList() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final data = preferences.getStringList("list");
  if (data == null) {
    return [];
  }
  List<Map<String, dynamic>> jsonList = data.map((item) {
    return jsonDecode(item) as Map<String, dynamic>;
  }).toList();

  List<ToDo> toDoList = jsonList.map((json) {
    return ToDo.fromJson(json);
  }).toList();

  return toDoList;
}