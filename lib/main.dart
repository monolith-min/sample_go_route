import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_auto_route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter _router = AppRouter().router;

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

//https://www.raywenderlich.com/28987851-flutter-navigator-2-0-using-go_router
//https://pub.dev/packages/go_router/example
class FirstScreen extends StatelessWidget {
  static const routeName = '/';

  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/second');
                  context.push(SecondScreen.routeName);
                },
                child: Text(
                  "navigate 1",
                  style: TextStyle(fontSize: 30),
                )),
            GestureDetector(
                onTap: () {
                  // context.goNamed("test", params: {
                  //   'title': "Accept Arguments Screen",
                  //   'msg' : "This message is extracted in the onGenerateRoute function."
                  // });

                  context.push('${ThirdScreen.routeName}?msg="msg"&title="asd"');
                },
                child: Text("sendData", style: TextStyle(fontSize: 30)))
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  static const routeName = '/second';

  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen'),
      ),
      body: Container(
        child: GestureDetector(
            onTap: (){
              context.go(FirstScreen.routeName);
            },
            child: Text("second 2")),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  static const routeName = '/extractArguments';
  // final ScreenArguments data;
  final String title;
  final String msg;

  // const ThirdScreen({Key? key, required this.data}) : super(key: key);
  const ThirdScreen({Key? key, required this.title, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThirdScreen'),
      ),
      body: GestureDetector(
        onTap: (){
          context.go(FirstScreen.routeName);
        },
        child: Container(
          child: Text("title : ${title}   message : ${msg}"),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
