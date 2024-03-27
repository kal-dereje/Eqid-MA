import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/userController.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxScroller) => [
                  SliverAppBar(
                      automaticallyImplyLeading: false,
                      toolbarHeight: 165,
                      backgroundColor: const Color(0XFF12D7A7).withOpacity(0.4),
                      elevation: 0,
                      title: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Date(), Profile()]))
                ],
            body: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const UpcomingTask(),
                          Tasks(),
                          const SchoolProjects(),
                          const SchoolProjects()
                        ])))),
        bottomNavigationBar: const Footers());
  }
}

String getCurrentDate() {
  var date = DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
  return formattedDate.toString();
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("images/avatar/one.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
        const ProfileName()
      ],
    );
  }
}

class ProfileName extends StatefulWidget {
  const ProfileName({super.key});

  @override
  State<ProfileName> createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Obx(
                () => Text(
                  "Hi " + userController.username.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    fontFamily: 'Futura',
                    color: Colors.black,
                  ),
                ),
              ),
              const Icon(
                Icons.verified_outlined,
                color: Color(0XFF343E87),
                size: 40,
              ),
            ])),
        const Padding(
            padding: EdgeInsets.only(),
            child: SizedBox(
                width: 190,
                child: Text(
                  'Welcome back Here is a list of thing we have for today !',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Futura',
                      color: Colors.black38),
                  maxLines: 3,
                ))),
      ],
    );
  }
}

class Date extends StatelessWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.calendar_today,
          color: Color.fromARGB(255, 41, 41, 41),
          size: 25,
        ),
        Text(
          getCurrentDate(),
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

class Tasks extends StatelessWidget {
  TimeOfDay time = const TimeOfDay(
    hour: 10,
    minute: 30,
  );
  DateTime date = DateTime(2023, 02, 12);

  Tasks({super.key});
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
              child: const Text("Add Category"),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          insetPadding: const EdgeInsets.only(
                              top: 38, bottom: 38, right: 25, left: 25),
                          contentPadding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          content: Builder(
                            builder: (context) {
                              // Get available height and width of the build area of this widget. Make a choice depending on the size.
                              var height = MediaQuery.of(context).size.height;
                              var width = MediaQuery.of(context).size.width;

                              return Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF052124)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  color: Color(0xFF12D7A7),
                                                  size: 30,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 7),
                                                    child: Text(
                                                      'Date',
                                                      style: TextStyle(
                                                        fontSize: 27,
                                                        fontFamily: 'Futura',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 203, 204, 205),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFF052124),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyHomePage()));
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                color: Color(0xFF12D7A7),
                                                size: 45,
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                        height: 55,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 3, 17, 19),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 3, 17, 19),
                                                shape: RoundedRectangleBorder(
                                                    //to set border radius to button
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () async {
                                              DateTime? newDate =
                                                  await showDatePicker(
                                                      builder:
                                                          (BuildContext context,
                                                              Widget? child) {
                                                        return Theme(
                                                          data: ThemeData(
                                                            splashColor:
                                                                Colors.black,
                                                            colorScheme: const ColorScheme.light(
                                                                primary: Color(
                                                                    0xFF052124),
                                                                primaryContainer:
                                                                    Colors
                                                                        .black,
                                                                secondaryContainer:
                                                                    Colors
                                                                        .black,
                                                                onSecondary: Colors
                                                                    .greenAccent,
                                                                onPrimary: Colors
                                                                    .greenAccent,
                                                                surface: Colors
                                                                    .greenAccent,
                                                                onSurface:
                                                                    Colors
                                                                        .black,
                                                                secondary:
                                                                    Colors
                                                                        .black),
                                                            dialogBackgroundColor:
                                                                Colors.white,
                                                          ),
                                                          child: child ??
                                                              const Text(""),
                                                        );
                                                      },
                                                      context: context,
                                                      initialDate: date,
                                                      firstDate: DateTime(1990),
                                                      lastDate: DateTime(2100));
                                            },
                                            child: Text(
                                              '${date.year}:${date.month}:${date.day}',
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Color(0xFF12D7A7),
                                              ),
                                            ))),
                                    const Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Color(0xFF12D7A7),
                                              size: 30,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7),
                                                child: Text(
                                                  'Time',
                                                  style: TextStyle(
                                                    fontSize: 27,
                                                    fontFamily: 'Futura',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 203, 204, 205),
                                                  ),
                                                ))
                                          ],
                                        )),
                                    Container(
                                        height: 44,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 3, 17, 19),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 3, 17, 19),
                                                shape: RoundedRectangleBorder(
                                                    //to set border radius to button
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () async {
                                              TimeOfDay? newTime =
                                                  await showTimePicker(
                                                      builder:
                                                          (BuildContext context,
                                                              Widget? child) {
                                                        return Theme(
                                                          data: ThemeData(
                                                            splashColor:
                                                                Colors.black,
                                                            colorScheme: const ColorScheme.light(
                                                                primary: Colors
                                                                    .greenAccent,
                                                                primaryContainer:
                                                                    Colors
                                                                        .black,
                                                                secondaryContainer:
                                                                    Colors
                                                                        .black,
                                                                onSecondary:
                                                                    Colors
                                                                        .white,
                                                                onPrimary:
                                                                    Colors
                                                                        .white,
                                                                surface: Colors
                                                                    .white,
                                                                onSurface:
                                                                    Colors
                                                                        .black,
                                                                secondary:
                                                                    Colors
                                                                        .black),
                                                            dialogBackgroundColor:
                                                                Colors.white,
                                                          ),
                                                          child: child ??
                                                              const Text(""),
                                                        );
                                                      },
                                                      context: context,
                                                      initialTime: time);
                                              if (newTime == null) {
                                                return;
                                              }
                                            },
                                            child: Text(
                                              '${time.hour}:${time.minute}',
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Color(0xFF12D7A7),
                                              ),
                                            ))),
                                    const Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.task_outlined,
                                              color: Color(0xFF12D7A7),
                                              size: 30,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7),
                                                child: Text(
                                                  'Task',
                                                  style: TextStyle(
                                                    fontSize: 27,
                                                    fontFamily: 'Futura',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 203, 204, 205),
                                                  ),
                                                ))
                                          ],
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                          width: 300,
                                          height: 46,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color.fromARGB(
                                                255, 3, 17, 19),
                                          ),
                                          child: const TextField(
                                              decoration: InputDecoration(
                                            labelText: 'Name of task',
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 148, 149, 149),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.more_horiz,
                                              color: Color(0xFF12D7A7),
                                              size: 30,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7),
                                                child: Text(
                                                  'Remark',
                                                  style: TextStyle(
                                                    fontSize: 27,
                                                    fontFamily: 'Futura',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 203, 204, 205),
                                                  ),
                                                )),
                                          ],
                                        )),
                                    Container(
                                        width: 300,
                                        height: 46,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 3, 17, 19),
                                        ),
                                        child: const TextField(
                                            decoration: InputDecoration(
                                          labelText: 'Event,description,etc...',
                                          labelStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 148, 149, 149),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ))),
                                    Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: const Color.fromARGB(
                                                      255, 14, 71, 79)
                                                  .withOpacity(0.5)),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.greenAccent,
                                            size: 50,
                                          ),
                                        ))
                                  ],
                                ),
                              );
                            },
                          ),
                        ));
              },
            ),
          )
        ])
      ],
    );
  }
}

class SchoolProjects extends StatelessWidget {
  const SchoolProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 10, left: 25),
            child: Text('School Project(3)',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w900,
                    color: Colors.black))),
        Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      const Color.fromARGB(255, 244, 177, 150).withOpacity(0.5),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40, top: 10),
                                  child: Icon(
                                    Icons.check_box_rounded,
                                    color: Color.fromARGB(255, 66, 109, 235),
                                    size: 20,
                                  ),
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 13),
                                          child: Text(
                                            'UI/UX Design Assignmnet',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Futura',
                                              color: Colors.black,
                                            ),
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 5),
                                          child: Text(
                                            '10:30PM Zoom Meeting',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Futura',
                                              color: Colors.black45,
                                            ),
                                          ))
                                    ]),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10, top: 10),
                              child: Icon(
                                Icons.more_vert,
                                color: Color.fromARGB(255, 41, 41, 41),
                                size: 20,
                              ),
                            ),
                          ]),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40, top: 10),
                                  child: Icon(
                                    Icons.check_box_rounded,
                                    color: Color.fromARGB(255, 66, 109, 235),
                                    size: 20,
                                  ),
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 13),
                                          child: Text(
                                            'UI/UX Design Assignmnet',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Futura',
                                              color: Colors.black,
                                            ),
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 5),
                                          child: Text(
                                            '10:30PM Zoom Meeting',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Futura',
                                              color: Colors.black45,
                                            ),
                                          ))
                                    ]),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 10, top: 10, bottom: 30),
                              child: Icon(
                                Icons.more_vert,
                                color: Color.fromARGB(255, 69, 69, 69),
                                size: 20,
                              ),
                            ),
                          ]),
                      Container(
                          height: 32,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          child: const Row(
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

class Footers extends StatelessWidget {
  const Footers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 223, 223, 223)),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 3),
                child: Icon(
                  Icons.file_copy_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 3),
                child: Icon(
                  Icons.people,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 3),
                child: Icon(
                  Icons.person_3_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ]));
  }
}

class UpcomingTask extends StatelessWidget {
  const UpcomingTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 35, left: 16),
                child: Text('Upcoming Tasks',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.w800,
                        color: Colors.black))),
            Padding(
              padding: EdgeInsets.only(top: 35, right: 10),
              child: Text(
                'View all',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Futura',
                  color: Color(0XFF343E87),
                ),
              ),
            ),
          ]),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Expanded(
              child: Row(children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    height: 130,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 129, 234, 129)
                          .withOpacity(0.5),
                    ),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Personal project',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Futura',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Icon(
                                Icons.circle,
                                color: Color.fromARGB(255, 60, 210, 73),
                                size: 9,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Deploy my Portfolio website',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Futura',
                                          color: Colors.black),
                                      maxLines: 3,
                                    ))),
                          ]),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '3 hours left',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 164, 164, 164),
                              ),
                            ),
                          ),
                        ]))),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    height: 130,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 129, 171, 234)
                          .withOpacity(0.5),
                    ),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Personal project',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Futura',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Icon(
                                Icons.circle,
                                color: Color.fromARGB(255, 60, 120, 210),
                                size: 9,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Deploy my Portfolio website',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Futura',
                                          color: Colors.black),
                                      maxLines: 3,
                                    ))),
                          ]),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '3 hours left',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 164, 164, 164),
                              ),
                            ),
                          ),
                        ]))),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    height: 130,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 231, 129, 234)
                          .withOpacity(0.5),
                    ),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Personal project',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Futura',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Icon(
                                Icons.circle,
                                color: Color.fromARGB(255, 203, 60, 210),
                                size: 9,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Deploy my Portfolio website',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Futura',
                                          color: Colors.black),
                                      maxLines: 3,
                                    ))),
                          ]),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '3 hours left',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 164, 164, 164),
                              ),
                            ),
                          ),
                        ])))
          ])))
    ]);
  }
}
