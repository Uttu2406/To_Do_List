import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/model/todo.dart';
import 'package:to_do/utils/get_list.dart';

saveList(String listTitle, bool isDone)async{
  final ToDo toDo = ToDo(todoText: listTitle,isDone: isDone);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final datas =await getList();
  datas.add(toDo);
  List<String> jsonList = datas.map((item) {
    return jsonEncode(item.toJson());
  }).toList();
  preferences.setStringList("list", jsonList);
}