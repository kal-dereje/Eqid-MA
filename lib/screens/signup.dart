import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test/endpoint.dart';
import 'login.dart';
//import 'package:shadow/shadow.dart';

class MySignUpPage extends StatelessWidget {
  const MySignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(color: Color(0xFF052124)),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Profile(),
                  Images(),
                  SignUp(),
                  const Inputs(),
                ]),
          )),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/eqidLogo.svg',
              width: 80.0,
              height: 75.0,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'images/Rectangle.svg',
              width: 60.0,
              height: 100.0,
            ),
          ],
        ),
      ],
    );
  }
}

class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List _items = [
      'images/avatar/one.jpg',
      'images/avatar/two.jpg',
      'images/avatar/three.jpg',
      'images/avatar/four.jpg',
      'images/avatar/five.jpg',
      'images/avatar/six.jpg',
      'images/avatar/seven.jpg',
      'images/avatar/eight.jpg',
      'images/avatar/nine.jpg',
      'images/avatar/ten.jpg',
      'images/avatar/eleven.jpg',
      'images/avatar/twelve.jpg',
      'images/avatar/thirteen.jpg',
      'images/avatar/fourteen.jpg',
      'images/avatar/fivteen.jpg',
    ];

    return SizedBox(
        width: 320,
        height: 300,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 1.0,
            crossAxisCount: 4,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(_items[index]), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(60)),
              ),
            ));
          },
        ));
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Color(0xFF12D7A7),
        ),
        label: const Text("Add Photo"),
      ),
      Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 5),
          child: Container(
            height: 1,
            width: 250,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xFF052124),
                  Color(0xFF12D7A7),
                  Color(0xFF052124),
                ],
                tileMode: TileMode.mirror,
              ),
              borderRadius: BorderRadius.circular(15),
              // boxShadow: Shadow(blurRadius: 3,color: )
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(right: 250),
          child: Container(
              height: 30,
              width: 200,
              decoration: const BoxDecoration(
                  color: Color(0xFF12D7A7),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'Create account:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Futura',
                          color: Colors.white,
                        ),
                      ))
                ],
              )))
    ]));
  }
}

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => _InputsState();
}

final userNameController = TextEditingController();
final emailController = TextEditingController();
final passwordNameController = TextEditingController();

class _InputsState extends State<Inputs> {
  @override
  Widget build(BuildContext context) {
    dio.Dio dioInstance = dio.Dio();
    Future submitForm() async {
      try {
        // Load the image file from the assets
        final byteData = await rootBundle.load('images/avatar/two.jpg');
        final bytes = byteData.buffer.asUint8List();

        // Get the temporary directory path
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/two.jpg';

        // Write the image bytes to the temporary file
        await File(imagePath).writeAsBytes(bytes);
        print("test");
        // Create FormData object

        dio.FormData formData = dio.FormData.fromMap({
          'username': userNameController.text.trim(),
          'email': emailController.text.trim(),
          'password': passwordNameController.text.trim(),
          'testImage':
              await dio.MultipartFile.fromFile(imagePath, filename: 'two.jpg'),
        });

        // Send the form data using POST request
        var res = await dioInstance.post('${EndPoint.api}/User/UserCreate',
            data: formData);

        print(res.statusCode);
        // Handle the response
        // ...
      } on dio.DioException catch (e) {
        if (e.response!.statusCode == 422) {
          snackBar(title: e.response!.data['message'] + '!', color: Colors.red);
        }
      }
    }

    return SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            width: 300.0,
            height: 27,
            child: TextField(
              controller: userNameController,
              style: const TextStyle(fontSize: 15.0, color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'User Name',
              ),
            )),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white),
              width: 300.0,
              height: 27,
              child: TextField(
                controller: emailController,
                style: const TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ))),
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white),
              width: 300.0,
              height: 27,
              child: TextField(
                controller: passwordNameController,
                style: const TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ))),
      Padding(
          padding: const EdgeInsets.only(
            left: 50,
          ),
          child: SizedBox(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF052124), //background color of button
                  ),
                  onPressed: () {
                    Get.to(() => const MyLoginPage());
                  },
                  child: const Row(children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 9,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 6,
                        ),
                        child: Text(
                          'Already have an account? LogIn',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Futura',
                            color: Color(0xFF12D7A7),
                          ),
                        )),
                  ])))),
      Container(
          height: 32,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF12D7A7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () async {
                await submitForm();
              },
              child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Futura',
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                      size: 20,
                    ),
                  ]))),
      const Padding(
          padding: EdgeInsets.only(top: 29),
          child: Text(
            'Developed by MrKuz R&d',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              fontFamily: 'Futura',
              color: Colors.white,
            ),
          ))
    ]));
  }
}

void snackBar({title, color}) {
  Get.snackbar(
    title,
    'This is the snackbar message',
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
    backgroundColor: color,
    colorText: Colors.white,
  );
}
