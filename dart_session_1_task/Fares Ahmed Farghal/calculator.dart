import 'dart:io';

void main(){
  stdout.write("Enter first number: ");
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter second number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter operation (+, -, *, /): ");
  String operation = stdin.readLineSync()!;

  double result =0 ;

  switch(operation)
  {
    case '+':
      result = num1 + num2;
      break;

    case '-':
      result = num1 - num2;
      break;

    case '*':
      result = num1 * num2;
      break;

    case '/':
      if (num2 != 0) {
        result = num1 / num2;
      } else {
        print("Error: Cannot divide by zero");
        return;
      }
      break;

    default:
      print("invalid operation");
      return;

  }


  print("Result: $result");
}