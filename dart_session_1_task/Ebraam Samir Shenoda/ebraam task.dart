import 'dart:io';

void main() {
  String? x = stdin.readLineSync();
  String? y = stdin.readLineSync();
  String? operation = stdin.readLineSync();
  int? s = int.tryParse(x!);
  int? d = int.tryParse(y!);
  switch (operation) {
    case "*":
      print(s! * d!);
      break;
    case "/":
      if (d != 0) {
        print(s! / d!);
        break;
      } else {
        print("you can't divide on 0");
        break;
      }
    case "+":
      print(s! + d!);
      break;
    case "-":
      print(s! - d!);
      break;
    default:
      print("no operation ");
      break;
  }
  ;
}
