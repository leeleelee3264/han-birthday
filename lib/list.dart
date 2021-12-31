import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:han_birthday/main.dart';
import 'package:pimp_my_button/pimp_my_button.dart';


class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prj.HAN',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
// TODO: 들어올때 타이핑 치는 메인 애니메이션 걸기 https://github.com/felixblaschke/simple_animations/blob/main/example/example.md
// TODO: 깃허브에 배포하기 https://origogi.github.io/flutter/Flutter-Github-%EC%97%B0%EB%8F%99/
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todos = [];
  String input = "";

//  TODO: 리스트 꾸미기
//   https://sergiandreplace.com/planets-flutter-from-design-to-app/
  @override
  void initState() {
    super.initState();
    todos.add("한지연 배우님의 생일을 진심으로 축하드립니다!!");
    todos.add("배우님이 무대 위에서 보여주시는 멋진 모습에");
    todos.add("항상 많이많이 배우고 있습니다!");
    todos.add("늘 건강하시고 맛있는 것도 많이많이 드시길 바랍니다.");
    todos.add("다음에 또 무대에서 뵙는 그 날까지");
    todos.add("행복하세용!! 감사합니다!!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 20.0,
                child: ScaleAnimation(
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: PimpedButton(
                      particle: RectangleDemoParticle(),
                      pimpedWidgetBuilder: (context, controller) {
                        return ListTile(
                          title: Text(todos[index]),
                          subtitle: const Text(
                            "Click the card to remove!",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          onTap: () {
                            controller.forward(from: 0.0);
                            setState(() {
                              todos.removeAt(index);

                              if(todos.length == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyApp()),
                                );
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
