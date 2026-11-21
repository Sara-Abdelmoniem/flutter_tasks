import 'dart:io';
void main() {
  String p='+';
  String m='*';
  String d='/';
  String s='-';
  print("Enter first number:");
  num x=int.parse(stdin.readLineSync()!);
  print("Enter second number:");
  num y=int.parse(stdin.readLineSync()!);
  print("Enter operation:");
  String? o=stdin.readLineSync()!;
  num result;
  if(o==p){
    result=x+y;
  }
  else if(o==m){
    result=x*y;
  }
  else if(o==s) {
    result=x-y;
  }

  else if(o==d) {
    if (y == 0) {
      print('invalid');
      return;
    }
    result = x / y;
  }
  else{
    print('invalid operation');
    return;
  }

  print(result);
}