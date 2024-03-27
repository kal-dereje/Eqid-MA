import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controllers/userController.dart';

class Profile extends StatelessWidget {
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
            width: 80,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("images/avatar/one.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
        ProfileName()
      ],
    );
  }
}

class ProfileName extends StatelessWidget {
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(children: [
              Obx(
                () => Text(
                  "Hi ${userController.username}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'Futura',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.verified_outlined,
                color: Color(0XFF343E87),
                size: 35,
              ),
            ])),
        const Padding(
            padding: EdgeInsets.only(),
            child: SizedBox(
                width: 190,
                child: Text(
                  'Welcome back Here is a list of thing we have for today !',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Futura',
                      color: Colors.black38),
                  maxLines: 3,
                ))),
      ],
    );
  }
}
