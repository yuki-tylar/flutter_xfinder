import 'package:finder_x/classes/xfinder_tree.dart';
import 'package:finder_x/enums/xfinder_tree_item_type.dart';
import 'package:finder_x/widgets/xfinder_tree_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class XfinderTreePage extends StatelessWidget {
  final XFinderTree tree;
  final Function(XFinderTreeItem file) onFileSelected;
  const XfinderTreePage({
    Key? key,
    required this.tree,
    required this.onFileSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tree.items == null
        ? SpinKitThreeBounce()
        : ListView(
            children: tree.items!
                .map(
                  (e) => XFinderTreeListItem(
                    item: e,
                    onSelected: () {
                      if (e.type == XFinderTreeItemType.tree) {
                        print(e.path);
                      } else {
                        onFileSelected(e);
                      }
                    },
                  ),
                )
                .toList(),
          );
  }
}
