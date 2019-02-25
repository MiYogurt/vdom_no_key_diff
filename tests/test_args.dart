import 'package:test/test.dart';

class A {

}

check(dynamic a){
  print(a.runtimeType);
}

main(List<String> args) {
  check(A);
}