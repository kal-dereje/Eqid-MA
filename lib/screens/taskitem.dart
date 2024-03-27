import 'package:flutter/material.dart';

import '../model/todo.dart';

class Taskitem extends StatelessWidget {
  final todoList = Todo.todoList();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 16, bottom: 10, left: 25),
            child: Text(
              'School Project(3)',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Futura',
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            )),
        Padding(
            padding: EdgeInsets.all(4),
            child: Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 244, 177, 150).withOpacity(0.5),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // for(Todo todo in todoList)

                      Container(
                          height: 32,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15, top: 3),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.greenAccent,
                                    size: 25,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 10, top: 7),
                                    child: Text(
                                      'AddTask',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Futura',
                                        color: Colors.white,
                                      ),
                                    )),
                              ]))
                    ])))
      ],
    );
  }
}
