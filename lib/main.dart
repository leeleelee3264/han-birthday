import 'package:flutter/material.dart';
import 'package:han_birthday/list.dart';
import 'package:han_birthday/text_writer_text.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: TypeWriterBox(),
    );
  }
}

class TypeWriterBox extends StatefulWidget {
  static final boxDecoration = BoxDecoration(
      color: Colors.orange[400],
      borderRadius: BorderRadius.all
        (Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 15,
            offset: Offset(0, 8),
            spreadRadius: 5
        )
      ]);

  const TypeWriterBox({Key? key}) : super(key: key);

  @override
  _TypeWriterBoxState createState() => _TypeWriterBoxState();
}

class _TypeWriterBoxState extends State<TypeWriterBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlayAnimation<double>(
          duration: 400.milliseconds,
          tween: 0.0.tweenTo(80.0),
          builder: (context, child, height) {
            return PlayAnimation<double>(
              duration: 1600.milliseconds,
              delay: 500.milliseconds,
              tween: 2.0.tweenTo(300.0),
              builder: (context, child, width) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp2()),
                    );
                  },
                  child: Container(
                    decoration: TypeWriterBox.boxDecoration,
                    width: width,
                    height: height,
                    child: typewriter(width)
                        ? TypeWriterText("Happy Birthday Prj.")
                        : Container(),
                  ),
                );

              },
            );
          },
        ),
      ),
    );
  }

  bool typewriter(double width) => width > 15;
}