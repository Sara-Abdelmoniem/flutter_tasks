import 'dart:io' ;

void main() {
  print("***Calculator***") ;
    print("Enter first num ") ;
    int? num1 =int.tryParse(stdin.readLineSync()??'') ;
    print("Enter second num ") ;
    int? num2 =int.tryParse(stdin.readLineSync()??'') ;
    print("Enter an operation character") ;
    String?  op=(stdin.readLineSync()??'') ;
    if(num1==null||num2==null){
      print("null");
      return ;
              }
    switch(op){
    case '+':
    print("${num1+num2}") ;
    break ;
    case '-' :
    print("${num1-num2}");
    break ;
    case '*' :
    print("${num1*num2}");
   break ;
    case '/'   :
      if(num2==0) {
        print("invalid num");
       return ;
      }
    print("${num1/num2}");
    break ;
      default :
        print("invalid operation") ;
    }
     }
