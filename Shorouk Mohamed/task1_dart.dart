import 'dart:io';
void main (){

  print("Enter First Number : ");
 String ?x= stdin.readLineSync();
 int ?x1 =int.tryParse(x!);

print("Enter Second Number : ");
String ?y= stdin.readLineSync();
int ?y1 =int.tryParse(y!);

  print("Enter operation(+, -, *, /) : ");
  String ?z= stdin.readLineSync();

 switch(z)
 {
   case "+":
     print(x1!+y1!);
         break;

   case "-":
     print(x1!-y1!);
     break;

   case "*":
     print(x1!*y1!);
     break;

   case "/":
     print(x1!/y1!);
     break;

     default:
       print("Invalid operator");



 }
}