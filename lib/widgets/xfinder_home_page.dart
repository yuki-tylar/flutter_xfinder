import 'package:flutter/material.dart';

class XFinderHomePage extends StatelessWidget {
  const XFinderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Github'),
        ),
      ],
    );
  }
}
