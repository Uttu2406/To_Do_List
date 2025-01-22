import 'package:flutter/material.dart';
import 'package:to_do/screens/navbar.dart';
import 'package:to_do/utils/get_list.dart';
import 'package:to_do/utils/save_list.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  loadData()async{
    final list = await getList();
    setState(() {
      _foundToDo = list;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
    // _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,

      drawer: Navbar(),

      // App Bar that appears on top
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 2,
        shadowColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Taskify"),
            

            // Icon(
            //   Icons.menu,
            //   color: tdBlack,
            //   size: 35,
            // ),

            // InkWell(
            //   child: CircleAvatar(
            //     radius: 20,
            //     backgroundColor: tdBlack,
            //     child: CircleAvatar(
            //       radius: 19,
            //       backgroundImage: AssetImage('assets/uttu.png'),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => profile(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),

      //Body Part
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: tdBlack,
                        size: 20,
                      ),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 20, minWidth: 25),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: tdGrey),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      // Text - "To-Do List"
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "To-Do List",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),

                      for (ToDo toDo in _foundToDo)
                        ToDoItem(
                          todo: toDo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffdddddd),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: "Add a New To-Do Item",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: ()async {
                      // print("Click Detected - Add Item");
                      if(_todoController.text.isNotEmpty ){
                        _addToDoItem(_todoController.text.trim());

                      }
                      await loadData();
                     
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    // setState(() {
    //   todosList.removeWhere((item) => item.id == id);
    // });
  }

  void _addToDoItem(String toDo) {
    // print("ff "+toDo);
  saveList(toDo, false);
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    // List<ToDo> results = [];
    // if (enteredKeyword.isEmpty) {
    //   results = todosList;
    // } else {
    //   results = todosList
    //       .where((item) => item.todoText!
    //           .toLowerCase()
    //           .contains(enteredKeyword.toLowerCase()))
    //       .toList();
    // }

    // setState(() {
    //   _foundToDo = results;
    // });
  }
}
