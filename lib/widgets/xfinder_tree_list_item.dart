import 'package:finder_x/classes/xfinder_tree.dart';
import 'package:flutter/material.dart';

import '../enums/xfinder_tree_item_type.dart';

class XFinderTreeListItem extends StatelessWidget {
  final XFinderTreeItem item;
  final Function() onSelected;
  const XFinderTreeListItem({
    Key? key,
    required this.item,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: ListTile(
        leading: Icon(item.type.icon),
        title: Text(item.path),
        trailing: item.type == XFinderTreeItemType.tree
            ? Icon(Icons.chevron_right_outlined)
            : null,
      ),
    );
  }
}
