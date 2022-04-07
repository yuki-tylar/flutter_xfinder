import 'package:flutter/material.dart';

enum XFinderTreeItemType {
  blob,
  tree,
}

extension XFinderTreeItemTypeExtension on XFinderTreeItemType {
  IconData get icon {
    switch (this) {
      case XFinderTreeItemType.tree:
        return Icons.folder_outlined;
      case XFinderTreeItemType.blob:
        return Icons.file_open_outlined;
    }
  }
}

convertTypeToEnum(String s) =>
    XFinderTreeItemType.values.firstWhere((element) => element.name == s);
