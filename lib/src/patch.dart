
// 处理特殊情况
  // 新老节点相等 old == new 继续判断
  // old 节点为 null，或者 old 和 new 的 tagName 不一样，
    // 表示要创建 new element
    // 假如 old 节点不为空，需要移除
  // old 的 tagName 为 null，说明是 text 节点，则 node 是字符串
    // element.nodeValue = node 更新文本
  // 接下来处理普通情况
    // 先更新 new element 的 attrs，
    // 先遍历 old node，拿到 oldkey, 用 object 唯一key 特性存下当前node的 element 和 node
    // 遍历 new node，循环 index 为 k，old key 为 index 为 i
      // 取 oldkey 

import 'dart:html';
import 'h.dart';
import 'base.dart';

Node patch(Node parent, dynamic element, dynamic oldNode, dynamic node) {
  if (oldNode is String && node is String && oldNode != node && element is Text) {
    element.replaceWith(Text(node));
    return element;
  }

  if (oldNode is Node && node is String) {
    var newEl = createElement(node);
    parent.insertBefore(newEl, element);
    element = newEl;
    return element;
  }

  if (oldNode is String && node is Node) {
    var newEl = createElement(node);
    parent.insertBefore(newEl, element);
    element = newEl;
    return newEl;
  } 

    // 处理子节点
    // TODO: update attrs
    List oldElements = element.childNodes;
    List oldChildren = oldNode.children;
    List children = node.children;
    var k = 0;
    while (k < node.children.length) {
      log(oldChildren[k]);
      log("--- to ---");
      log(children[k]);
      patch(element, oldElements[k], oldChildren[k], children[k]);
      k++;
    }

    return element;

}