@JS()
library base;
import 'package:js/js.dart';
import 'dart:html';

@JS('document.createTextNode')
@anonymous
external Element createTextNode(String text);

@JS('console.log')
@anonymous
external void log(dynamic obj);
