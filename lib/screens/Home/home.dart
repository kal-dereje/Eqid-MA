import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:test/controllers/categoryController.dart';
import 'package:test/screens/Home/Footer.dart';
import 'package:test/screens/Home/addtask.dart';
import 'package:test/screens/Home/profiles.dart';
import 'package:test/screens/Home/task.dart';
import 'package:test/screens/Home/tasklist.dart';
import 'package:test/screens/Home/upcomingtasks.dart';

import '../../controllers/userController.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final UserController userController = Get.put(UserController());
  final CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        color: const Color(0XFF12D7A7).withOpacity(0.25),
                        child: Column(
                          children: [
                            Date(),
                            Profile(),
                          ],
                        ),
                      ),
                      UpcomingTask(),
                      Tasks(),
                      Obx(
                        () => ListView.builder(
                            shrinkWrap: true,
                            itemCount: categoryController.categorys.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Category(
                                categoryName: categoryController
                                    .categorys[index]['categoryName'],
                                categoryId: categoryController.categorys[index]
                                    ['_id'],
                              );
                            }),
                      ),
                    ]))),
        bottomNavigationBar: Footers());
  }
}

// ignore: must_be_immutable
class Date extends StatelessWidget {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Icons.calendar_today,
          color: Color.fromARGB(255, 41, 41, 41),
          size: 25,
        ),
        Text(
          '${date.day}/${date.month}/${date.year}',
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Futura',
            color: Colors.black45,
          ),
        )
      ],
    );
  }
}

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<String> nameList = [];
  String name = '';
  final CategoryController categoryController = Get.find<CategoryController>();

  final dio = Dio();
  void showNameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 14, 23, 41),
          title: const Text(
            'Category Name',
            style: TextStyle(color: Colors.greenAccent),
          ),
          content: TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 14, 23, 41),
                  hintText: 'Enter  Category',
                  hintStyle: const TextStyle(color: Colors.greenAccent))),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                // Category();
                // setState(() {
                //   nameList.add(name);
                // });
                var token = await SessionManager().get('token');
                token = token.toString();
                print("here");
                try {
                  // Send the form data using POST request
                  var res = await dio.post(
                      'http://192.168.43.119:5001/api/Category/CreateCategory',
                      data: {
                        'categoryName': name,
                      },
                      options: Options(headers: {
                        "Content-type": "application/json",
                        "Authorization": "Bearer $token"
                      }));

                  print("success");
                } on DioException catch (e) {
                  if (e.response!.statusCode == 401) {
                    print(e.message.toString());
                  }
                }
                categoryController.fetchCategory();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 10, left: 16),
            child: Text('Tasks',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w900,
                    color: Colors.black))),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(
              padding: EdgeInsets.only(top: 10, left: 16),
              child: Icon(
                Icons.add,
                color: Colors.greenAccent,
                size: 20,
              )),
          Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: TextButton(
                onPressed: showNameDialog,
                child: const Text(
                  'Add Category',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Futura',
                    color: Colors.black,
                  ),
                ),
              ))
        ])
      ],
    );
  }
}

class Category extends StatefulWidget {
  final categoryName;
  final categoryId;

  const Category(
      {super.key, required this.categoryName, required this.categoryId});
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final tasklist = TodoTasks.tasklist();

  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 10, left: 25),
        child: Row(
          children: [
            Text(
              widget.categoryName,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Futura',
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                categoryController.deleteCategory(widget.categoryId);
              },
              child: const Icon(Icons.close),
            ),
            InkWell(
              onTap: () {
                categoryController.updateCategory(
                    widget.categoryId, widget.categoryName);
              },
              child: const Icon(Icons.edit),
            )
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 400,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    const Color.fromARGB(255, 150, 152, 244).withOpacity(0.5),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 400,
                        height: 100,
                        child: SingleChildScrollView(
                          child: Column(children: <Widget>[
                            for (TodoTasks taskss in tasklist)
                              Taskitem(
                                tasks: taskss,
                                handleChange: handleChange,
                                deleteItem: deleteItem,
                              ),
                          ]),
                        )),
                    Padding(padding: const EdgeInsets.all(10), child: Addtask())
                  ])))
    ]);
  }

  void handleChange(TodoTasks tasks) {
    if (tasks.isDone == true) {
      setState(() {
        tasks.isDone = false;
      });
    } else if (tasks.isDone == false) {
      setState(() {
        tasks.isDone = true;
      });
    }
  }

  void deleteItem(String id) {
    setState(() {
      tasklist.removeWhere((item) => item.id == id);
    });
  }
}
