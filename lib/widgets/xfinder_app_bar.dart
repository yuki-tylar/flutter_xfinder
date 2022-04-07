import 'package:flutter/material.dart';

class XFinderAppBar extends StatelessWidget {
  final Color toolbarColor;
  final String title;
  final int currentLevel;
  final int maxLevel;
  final TextStyle? titleStyle;
  final Function() onGoback;
  final Function() onGofoward;

  const XFinderAppBar({
    Key? key,
    required this.toolbarColor,
    required this.currentLevel,
    required this.maxLevel,
    required this.onGoback,
    required this.onGofoward,
    this.title = '',
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: toolbarColor,
      height: 60,
      alignment: Alignment.centerLeft,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          Wrap(
            children: [
              IconButton(
                onPressed: currentLevel == 0 ? null : onGoback,
                icon: const Icon(Icons.chevron_left),
              ),
              IconButton(
                onPressed: currentLevel == maxLevel ? null : onGofoward,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
          Text(title, style: titleStyle)
        ],
      ),
    );
  }
}
