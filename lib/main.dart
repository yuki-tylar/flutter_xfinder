import 'package:finder_x/classes/xfinder_tree.dart';
import 'package:finder_x/fake_data.dart';
import 'package:finder_x/xfinder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        buttonTheme: const ButtonThemeData(
          splashColor: Colors.transparent,
          disabledColor: Colors.grey,
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      theme: ThemeData(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {});
    var fakeTree = XFinderTree.fromGithub(fakeTreeRoot);
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black12,
            child: XFinder(
              initialTree: fakeTree,
              onFileSelected: (file) {
                print(file.url);
              },
            ),
            width: 300,
          ),
          Expanded(
            child: XFinder(
              onFileSelected: (file) {},
            ),
          ),
        ],
      ),
    );
  }
}
