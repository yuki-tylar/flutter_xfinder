import 'package:finder_x/classes/xfinder_tree.dart';
import 'package:finder_x/widgets/xfinder_app_bar.dart';
import 'package:finder_x/widgets/xfinder_home_page.dart';
import 'package:finder_x/widgets/xfinder_tree_page.dart';
import 'package:flutter/material.dart';

class XFinder extends StatefulWidget {
  final Color toolbarColor;
  final Color toolbarColorDark;
  final XFinderTree? initialTree;
  final TextStyle? titleStyle;
  final Function(XFinderTreeItem file) onFileSelected;

  // TODO: need to add more arguments
  // ex: titleStyle for darkmode?
  const XFinder({
    Key? key,
    this.toolbarColor = const Color(0x01EEEEEE),
    this.toolbarColorDark = const Color(0xFF1E1E1E),
    this.titleStyle,
    this.initialTree,
    required this.onFileSelected,
  }) : super(key: key);

  @override
  State<XFinder> createState() => _XFinderState();
}

class _XFinderState extends State<XFinder> {
  late List<Widget> pages;
  late PageController pageController;
  late int currentPage;

  @override
  void initState() {
    pages = [
      const XFinderHomePage(),
      if (widget.initialTree != null)
        XfinderTreePage(
          tree: widget.initialTree!,
          onFileSelected: widget.onFileSelected,
        )
    ];
    currentPage = pages.length - 1;
    pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  changePageTo(int i) => pageController.animateToPage(
        i > 0 ? i : 0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.ease,
      );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var darkmode = theme.brightness == Brightness.dark;

    return Column(
      children: [
        XFinderAppBar(
          currentLevel: currentPage,
          maxLevel: pages.length - 1,
          onGoback: () {
            var nextPage = currentPage > 0 ? currentPage - 1 : 0;
            changePageTo(nextPage);
            setState(() => currentPage = nextPage);
          },
          onGofoward: () {
            var nextPage = currentPage < pages.length - 1
                ? currentPage + 1
                : pages.length - 1;
            changePageTo(nextPage);
            setState(() => currentPage = nextPage);
          },
          toolbarColor:
              darkmode ? widget.toolbarColorDark : widget.toolbarColor,
          titleStyle: widget.titleStyle ?? theme.textTheme.headline6,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: PageView(
              controller: pageController,
              children: pages,
            ),
          ),
        ),
      ],
    );
  }
}
