import 'dart:html';

class VNode{
  String nodeName;
  Map attributes;
  List children;
  String key;
  Element el;

  VNode(this.nodeName, this.attributes, [this.children, this.key]) {
    if (this.attributes == null) {
      this.attributes = {};
    }
    if (this.children == null) {
      this.children = [];
    }
    if (this.key == null) {
      this.key = '';
    }
  }

  VNode copy(){
    return VNode(this.nodeName, this.attributes, this.children, this.key);
  }

  VNode deepCopy(){
    if(children.isEmpty){
      return copy();
    }

    var child = this.children.map((child) {
      if (child is VNode) {
        return child.deepCopy();
      }
      return child;
    }).toList();

    return VNode(this.nodeName, this.attributes, child, this.key);
  }
}