import 'dart:io';
void main() {
  print("Enter first number: ");
  int num1 = int.parse(stdin.readLineSync() ?? "0");
  print("Enter second number: ");
  int num2 = int.parse(stdin.readLineSync() ?? "0");
  print("Enter operator: ");
  String operator = stdin.readLineSync() ?? "";

  switch (operator) {
    case "+": print(num1 + num2); break;
    case "-": print(num1 - num2); break;
    case "*": print(num1 * num2); break;
    case "/": print(num1 / num2); break;
    default: print("Invalid Operator!");
  }
}