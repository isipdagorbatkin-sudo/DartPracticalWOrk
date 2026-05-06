void main() {

  var s = ["Ванек","Темик","Илюха","Санек","Валерий","Славик"];
  var p = ["Мат","Физ","Инф","Ист"];

  var o = [
    [5,4,5,4],
    [4,4,4,5],
    [3,4,4,3],
    [5,5,5,5],
    [2,3,4,3],
    [4,5,4,4]
  ];

  print("Студенты");
  for (var i = 0; i < s.length; i++) {
    print((i+1).toString() + " " + s[i]);
  }

  print("\nПредметы");
  for (var i = 0; i < p.length; i++) {
    print((i+1).toString() + " " + p[i]);
  }

  print("\nОценки");

  for (var i = 0; i < s.length; i++) {

    for (var j = 0; j < p.length; j++) {

      print(s[i] + " - " + p[j] + " : " + o[i][j].toString());

    }

  }

  print("\nСредний по предметам");

  var sp = [];

  for (var j = 0; j < p.length; j++) {

    var sum = 0;

    for (var i = 0; i < s.length; i++) {
      sum = sum + o[i][j];
    }

    var sr = sum / s.length;

    sp.add(sr);

    print(p[j] + " = " + sr.toString());

  }

  print("\nСредний по студентам");

  var ss = [];

  for (var i = 0; i < s.length; i++) {

    var sum = 0;

    for (var j = 0; j < p.length; j++) {
      sum = sum + o[i][j];
    }

    var sr = sum / p.length;

    ss.add(sr);

    print(s[i] + " = " + sr.toString());

  }

  var b = ss[0];
  var bn = s[0];

  for (var i = 1; i < s.length; i++) {

    if (ss[i] > b) {
      b = ss[i];
      bn = s[i];
    }

  }

  print("\nЛучший студент");
  print(bn + " " + b.toString());

  var m = sp[0];
  var mp = p[0];

  for (var i = 1; i < p.length; i++) {

    if (sp[i] < m) {
      m = sp[i];
      mp = p[i];
    }

  }

  print("\nСамый сложный предмет");
  print(mp + " " + m.toString());

  var all = 0;
  var k = 0;

  for (var i = 0; i < s.length; i++) {

    for (var j = 0; j < p.length; j++) {

      all = all + o[i][j];
      k = k + 1;

    }

  }

  var srAll = all / k;

  print("\nОбщий средний");
  print(srAll.toString());

  print("\nВсе предметы");

  for (var i = 0; i < p.length; i++) {
    print(p[i]);
  }

  print("Количество: " + p.length.toString());

  print("\nБез двоек");

  for (var i = 0; i < s.length; i++) {

    var ok = true;

    for (var j = 0; j < p.length; j++) {

      if (o[i][j] == 2) {
        ok = false;
      }

    }

    if (ok) {
      print(s[i]);
    }

  }

  print("\nВсе оценки >=4");

  for (var i = 0; i < s.length; i++) {

    var ok = true;

    for (var j = 0; j < p.length; j++) {

      if (o[i][j] < 4) {
        ok = false;
      }

    }

    if (ok) {
      print(s[i]);
    }

  }

}