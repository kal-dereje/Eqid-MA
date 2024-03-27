import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test/endpoint.dart';
import 'package:test/screens/Home/home.dart';
import 'package:test/screens/signup.dart';
import 'package:dio/dio.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({
    super.key,
  });

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 234, 234),
      body: Container(
          padding: EdgeInsets.only(top: height * 0.08),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color(0xFF052124)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Images(), Login(), Inputs()],
            ),
          )),
    );
  }
}

class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
        height: 390,
        decoration: BoxDecoration(
          boxShadow: [const BoxShadow(blurRadius: 3, color: Colors.teal)],
          image: const DecorationImage(
              image: AssetImage('images/Login.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/eqidLogo.svg',
              width: 80.0,
              height: 45.0,
            ),
            const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Text(
                  'Let us Keep your mind fit!',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Futura',
                    color: Colors.white,
                  ),
                ))
          ],
        ));
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 1,
            width: 250,
            decoration: BoxDecoration(
              color: const Color(0xFF12D7A7),
              borderRadius: BorderRadius.circular(15),
              // boxShadow: Shadow(blurRadius: 3,color: )
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(right: 270),
          child: Container(
              height: 35,
              width: 150,
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
                        'LogIn',
                        style: TextStyle(
                          fontSize: 15,
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
  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            width: 300.0,
            height: 30,
            child: TextField(
              controller: emailController,
              style: const TextStyle(fontSize: 15.0, color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'email',
              ),
            )),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white),
              width: 300.0,
              height: 30,
              child: TextField(
                controller: passwordController,
                style: const TextStyle(
                    fontSize: 15.0, height: 0.5, color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ))),
      Padding(
          padding: const EdgeInsets.only(),
          child: SizedBox(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF052124), //background color of button
                    //border width and color
                    //elevation of button
                    //content padding inside button
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MySignUpPage()));
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
                          'Dont have an account? SignUp',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Futura',
                            color: Color(0xFF12D7A7),
                          ),
                        )),
                  ])))),
      Container(
          height: 32,
          width: 100,
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
                try {
                  print(emailController.text);
                  // Send the form data using POST request
                  var res = await dio.post('${EndPoint.api}/LoginUser', data: {
                    'email': emailController.text.trim(),
                    'password': passwordController.text.trim()
                  });

                  await SessionManager().set('token', res.data['token']);
                  print(res.data['token']);
                  await SessionManager().set('username', res.data['username']);
                  await SessionManager().set('email', res.data['email']);
                  Get.to(() => MyHomePage());
                } on DioException catch (e) {
                  if (e.response!.statusCode == 422) {
                    snackBar(
                        title: e.response!.data['message'], color: Colors.red);
                  }
                }
              },
              child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          'LogIn',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Futura',
                            color: Colors.white,
                          ),
                        )),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                      size: 27,
                    ),
                  ]))),
      const Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            'Developed by MrKuz R&d',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              fontFamily: 'Futura',
              color: Colors.white,
            ),
          ))
    ]));
  }
}

void showSnackBar({context, msg}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: const Color.fromRGBO(223, 58, 58, 1),
    content: Center(child: Text(msg)),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20),
  ));
}
