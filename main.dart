bool isZero(int number) {
  return number == 0;
}

void printInfo(int number, Function check) {
  print("$number is zero: ${check(number)}");
}

//要达到可选命名参数的用法，那就在定义函数的时候给参数加上 {}
void enable1Flags({required bool bold, bool? hidden}) =>
    print("$bold , $hidden");

//定义可选命名参数时增加默认值
void enable2Flags({bool bold = true, bool hidden = false}) =>
    print("$bold ,$hidden");

//可忽略的参数在函数定义时用[]符号指定
void enable3Flags(bool bold, [bool? hidden]) => print("$bold ,$hidden");

//定义可忽略参数时增加默认值
void enable4Flags(bool bold, [bool hidden = false]) => print("$bold ,$hidden");

class Point {
  num x = 0, y = 0;
  // num x, y, z;
  static num factor = 0;
  // 等同于 this.x = x, this.y = y
  // Point(this.x, this.y);
  // Point(this.x, this.y) : z = 0;
  // Point.bottom(num x) : this(x, 0); // 重定向构造函数
  void printInfo() => print("x: $x, y: $y");
  static void printFactor() => print(factor);
}

// 继承父类
class Vector extends Point {
  num z = 0;
  @override
  void printInfo() => print("x: $x, y: $y, z: $z");
}

// 实现接口
class Coordinate implements Point {
  num x = 0, y = 0; // 成员变量需要重新声明
  void printInfo() => print("x: $x, y: $y"); // 成员函数需要重新定义
}

// with关键字实现混入
class Coordinate2 with Point {}

class Vector2 {
  num x, y;
  Vector2(this.x, this.y);
  //重载加法运算符
  Vector2 operator +(Vector2 v) => Vector2(x + v.x, y + v.y);
  //重载相等运算符
  bool operator ==(dynamic v) => x == v.x && y == v.y;
}

main() {
  // hello world
  print("hello world");

  // 基本类型
  printNum();
  printBool();
  printString();
  printList();
  printMap();

  // 常量
  printConstant();

  // 函数
  Function f = isZero;
  int x = 10;
  int y = 0;
  printInfo(x, f);
  printInfo(y, f);
  //可选命名参数函数调用
  enable1Flags(bold: true, hidden: false); //true, false
  enable1Flags(bold: true); //true, null
  enable2Flags(bold: false); //false, false
  //可忽略参数函数调用
  enable3Flags(true, false); //true, false
  enable3Flags(
    true,
  ); //true, null
  enable4Flags(true); //true, false
  enable4Flags(true, true); // true, true

  // 类
  /*var p = new Point(100, 200);
  p.printInfo();
  Point.factor = 100;
  Point.printFactor();*/
  // var p1 = Point.bottom(100);
  // p1.printInfo();
  // 继承
  var v = Vector();
  v
    ..x = 1
    ..y = 2
    ..z = 3; // 级联运算符，等同于 v.x = 1; v.y = 2; v.z = 3;
  v.printInfo();
  // 实现
  var c = Coordinate();
  c
    ..x = 1
    ..y = 2;
  c.printInfo();
  print(c is Point); // true
  print(c is Coordinate); // true
  // 混入
  var c2 = Coordinate2();
  c2.printInfo();
  print(c2 is Point); // true

  // 运算符
  var v1 = Vector2(3, 3);
  var v2 = Vector2(2, 2);
  var v3 = Vector2(1, 1);
  print(v1 == (v2 + v3));
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
