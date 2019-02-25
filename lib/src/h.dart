import 'base.dart';
import 'node.dart';
import 'dart:html';

VNode h(String name, Map attributes, [List children, String key]){
  return VNode(name, attributes, children, key);
}

Element createElement(dynamic node) {
  if (node is VNode){
    var element = document.createElement(node.nodeName);
    if (node.children.isNotEmpty) {
      element.children.addAll(node.children.map((_) => createElement(_)));
    }
    return element;
  }
  return createTextNode(node);
}
