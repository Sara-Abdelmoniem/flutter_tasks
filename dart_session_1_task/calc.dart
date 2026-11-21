import 'dart:io';
void main()
{

  stdout.write("Enter first number:");
  double n1=double.parse(stdin.readLineSync()!);
  stdout.write("Enter second number:");
  double n2=double.parse(stdin.readLineSync()!);

  stdout.write("Enter operation(+, -, *, /): ");
  var x =stdin.readLineSync()!;
  double result ;

  switch(x)
  {
    case '+':
      result = n1 + n2;
      break;

    case'-':
      result = n1 - n2;
      break;

    case'*':
      result = n1 * n2;
      break;

    case'/':
      if (n2 == 0) {
        print("undefined function");
        return;
      }
      result = n1 / n2;
      break;

    default:
      print("invalid operation");
      return;

  }

  print('Result: $result');


}