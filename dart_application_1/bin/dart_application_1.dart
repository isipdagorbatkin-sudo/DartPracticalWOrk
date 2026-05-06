// 1. Кружка и Человек
class Mug {
  int water = 100;
  
  void drink(int amount) {
    water -= amount;
    if (water < 0) water = 0;
  }
}

class Person {
  String name;
  
  Person(this.name);
  
  void drinkFromMug(Mug mug, int amount) {
    mug.drink(amount);
    print('$name пьет из кружки ($amount мл)');
  }
}

// 2. Шкаф
class Cabinet {
  List<String> items = [];
  
  void putItem(String item) {
    items.add(item);
    print('Положили: $item');
  }
  
  void takeItem(String item) {
    if (items.contains(item)) {
      items.remove(item);
      print('Взяли: $item');
    }
  }
  
  void showItems() {
    print('В шкафу: $items');
  }
}

// 3. Гриф и Блин
class Weight {
  int value;
  Weight(this.value);
}

class Barbell {
  int maxLoad;
  List<Weight> leftWeights = [];
  List<Weight> rightWeights = [];
  
  Barbell(this.maxLoad);
  
  void addWeightLeft(Weight w) {
    if (getTotalWeight() + w.value <= maxLoad) {
      leftWeights.add(w);
      print('Добавили блин слева: ${w.value}кг');
    } else {
      print('Перегруз!');
    }
  }
  
  void addWeightRight(Weight w) {
    if (getTotalWeight() + w.value <= maxLoad) {
      rightWeights.add(w);
      print('Добавили блин справа: ${w.value}кг');
    } else {
      print('Перегруз!');
    }
  }
  
  int getTotalWeight() {
    int total = 0;
    for (var w in leftWeights) total += w.value;
    for (var w in rightWeights) total += w.value;
    return total;
  }
}

// 4. Конвертация денег
class CurrencyConverter {
  Map<String, double> rates = {
    'USD': 1.0,
    'EUR': 0.85,
    'RUB': 75.0,
  };
  
  double convert(double amount, String from, String to) {
    double inUSD = amount / rates[from]!;
    return inUSD * rates[to]!;
  }
}

// 6. Класс с перегруженными операциями
class Vector {
  double x, y;
  
  Vector(this.x, this.y);
  
  Vector operator +(Vector other) => Vector(x + other.x, y + other.y);
  Vector operator -(Vector other) => Vector(x - other.x, y - other.y);
  Vector operator *(double k) => Vector(x * k, y * k);
  double operator /(Vector other) => x / other.x + y / other.y;
  
  @override
  String toString() => '($x, $y)';
}

// 7. Автомобиль
enum CarState { stop, drive, turn }

class Car {
  CarState state = CarState.stop;
  
  void stop() {
    state = CarState.stop;
    print('Машина стоит');
  }
  
  void drive() {
    state = CarState.drive;
    print('Машина едет');
  }
  
  void turn() {
    state = CarState.turn;
    print('Машина поворачивает');
  }
}

// 8. Геометрические фигуры
abstract class Shape {
  double getArea();
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);
  
  @override
  double getArea() => width * height;
}

class Triangle extends Shape {
  double a, b, c;
  Triangle(this.a, this.b, this.c);
  
  @override
  double getArea() {
    double s = (a + b + c) / 2;
    return (s * (s - a) * (s - b) * (s - c)) as double;
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  
  @override
  double getArea() => 3.14 * radius * radius;
}

// 9. Конвертация систем счисления
class NumberConverter {
  static String toHex(int num) => num.toRadixString(16);
  static String toOctal(int num) => num.toRadixString(8);
  static int fromHex(String hex) => int.parse(hex, radix: 16);
  static int fromOctal(String octal) => int.parse(octal, radix: 8);
}

// 10. Список фигур с поиском максимальной площади
class ShapeCollection {
  List<Shape> shapes = [];
  
  void addShape(Shape shape) => shapes.add(shape);
  
  Shape? getMaxAreaShape() {
    if (shapes.isEmpty) return null;
    Shape max = shapes[0];
    for (var shape in shapes) {
      if (shape.getArea() > max.getArea()) {
        max = shape;
      }
    }
    return max;
  }
}

// 11. Стол со столовыми приборами
abstract class Utensil {
  String getName();
}

class Fork extends Utensil {
  @override
  String getName() => 'Вилка';
}

class Knife extends Utensil {
  @override
  String getName() => 'Нож';
}

class Spoon extends Utensil {
  @override
  String getName() => 'Ложка';
}

class Table {
  List<Utensil> utensils = [];
  
  void putUtensil(Utensil u) {
    utensils.add(u);
    print('Положили на стол: ${u.getName()}');
  }
  
  void removeUtensil(Utensil u) {
    utensils.remove(u);
    print('Убрали со стола: ${u.getName()}');
  }
}

// ТЕСТЫ
void main() {
  // 1
  var person = Person('Иван');
  var mug = Mug();
  person.drinkFromMug(mug, 20);
  
  // 2
  var cabinet = Cabinet();
  cabinet.putItem('Книга');
  cabinet.putItem('Пальто');
  cabinet.showItems();
  cabinet.takeItem('Книга');
  
  // 3
  var barbell = Barbell(100);
  barbell.addWeightLeft(Weight(20));
  barbell.addWeightRight(Weight(20));
  
  // 4
  var converter = CurrencyConverter();
  print(converter.convert(100, 'USD', 'RUB'));
  
  // 6
  var v1 = Vector(3, 4);
  var v2 = Vector(1, 2);
  print(v1 + v2);
  print(v1 - v2);
  print(v1 * 2);
  
  // 7
  var car = Car();
  car.drive();
  car.turn();
  car.stop();
  
  // 8 и 10
  var shapes = ShapeCollection();
  shapes.addShape(Rectangle(5, 10));
  shapes.addShape(Circle(3));
  shapes.addShape(Triangle(3, 4, 5));
  print('Максимальная площадь: ${shapes.getMaxAreaShape()?.getArea()}');
  
  // 9
  print(NumberConverter.toHex(255));
  print(NumberConverter.toOctal(64));
  
  // 11
  var table = Table();
  table.putUtensil(Fork());
  table.putUtensil(Knife());
  table.putUtensil(Spoon());
}