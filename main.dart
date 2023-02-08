main() {
  print("hello world");
  printNum();
  printBool();
  printString();
  printList();
  printMap();
  printConstant();
}

printNum() {
  int x = 1;
  int hex = 0x01;
  print(hex);
  double y = 1.1;
  double e = 1.1e5;
  print(e);
}

printBool() {
  bool y = true;
  bool n = false;
  if (y) {
    print("yes");
  }
  var x = 1.0;
  if (x > 0) {
    print("num > 0");
  }
}

printString() {
  var s = 'dart';
  var s1 = 'this is a uppercased string: ${s.toUpperCase()}'; // 内嵌
  var s2 = 'hello ' + s; // 拼接
  var s3 = """This is a 
multi-line string.""";
  print(s1);
  print(s2);
  print(s3);
}

printList() {
  var arr1 = <String>["Tom", "Andy", "Jack"];
  print(arr1);
  var arr2 = List<int>.of([1, 2, 3]);
  arr2.add(499);
  arr2.forEach((v) => print('${v}'));
}

printMap() {
  var map1 = <String, String>{"name": "Tom", 'sex': 'male'};
  print(map1);
  var map2 = new Map<String, String>();
  map2['name'] = 'Tom';
  map2['sex'] = 'male';
  map2.forEach((k, v) => print('${k}: ${v}'));
}

printConstant() {
  final name = "Geekr";
  const score = 100;

  // const 运行时不可变，final 可以
  int x = 1;
  int y = 2;
  // const z = x / y;
  final z = x / y;
  print(z);
}
