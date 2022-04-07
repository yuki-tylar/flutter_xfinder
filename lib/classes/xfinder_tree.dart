import 'package:finder_x/enums/xfinder_tree_item_type.dart';

class XFinderTree {
  late XFinderProvider provider;
  String? reference;
  List<XFinderTreeItem>? items;

  XFinderTree(
    this.provider, {
    this.reference,
    this.items,
  });

  XFinderTree.fromGithub(Map<String, dynamic> data) {
    provider = XFinderProvider.github;
    reference = data['url'];
    items = data['tree']
        .map<XFinderTreeItem>((e) => XFinderTreeItem.fromGithub(e))
        .toList();
  }
}

class XFinderTreeItem {
  late XFinderTreeItemType type;
  late String path;
  String? content;
  String? url;
  int? size;

  XFinderTreeItem(
    this.type,
    this.path, {
    this.content,
    this.url,
    this.size,
  });

  XFinderTreeItem.fromGithub(Map<String, dynamic> data) {
    type = convertTypeToEnum(data['type']);
    path = data['path'];
    if (data.containsKey('size')) size = data['size'];
    if (data.containsKey('url')) url = data['url'];
  }
}

enum XFinderProvider {
  github,
}
