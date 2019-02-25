import 'dart:html';
import 'package:hyperapp/hyperapp.dart';
import 'dart:async';

void main() {
  var oldNode = h('div', {}, [
    h('p', {}, ['hello world'])
  ]);

  var newNode = h('div', {}, [
    h('p', {}, ['good job'])
  ]);
  var root = querySelector('#output');

  var el = createElement(oldNode);
  root.children.add(el);

  Future.delayed(Duration(milliseconds: 5000)).then((_){
    patch(root, el, oldNode, newNode);
  });
}
