import "dart:io";
import 'dart:math';
void main(List<String> arguments) {
  bool again=true;
  do {
    stdout.write("Please enter first number: ");
    double? first_number = double.tryParse(stdin.readLineSync()!);
    if(first_number==null) {
      print("Invalid number");
      continue;
    }

    stdout.write("Please enter second number: ");
    double? second_number = double.tryParse(stdin.readLineSync()!);
    if(second_number==null) {
      print("Invalid number");
      continue;
    }

    stdout.write("Please enter operation(+, -, *, /, % , ^): ");
    String? operator = stdin.readLineSync()!;

    if (operator != '+' && operator != '-' && operator != '*' &&
        operator != '/' && operator != '%' && operator != '^') {
      print("Invalid operator");
      continue;
    }

    double? result;
    switch (operator) {
      case '+':
        result=first_number + second_number;
        break;
      case '-':
        result=first_number - second_number;
        break;
      case '*':
        result=first_number*second_number;
        break;
      case '/':
        if (second_number == 0) {
          print("Invalid number");
          continue;
        }
        result=first_number/ second_number;
        break;
      case '%':
        if (second_number == 0) {
          print("Invalid number");
          continue;
        }
        result=first_number%second_number;
        break;
      case '^':
        result = pow(first_number, second_number).toDouble();
        break;
    }
    print("Result= ${result}");
    stdout.write("Do you want to calculate again? (true/false): ");
    again = stdin.readLineSync()! == "true";
  }while(again);
}
