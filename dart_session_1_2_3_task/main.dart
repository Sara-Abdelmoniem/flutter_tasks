import 'dart:io';
enum  sessionLevel{
  beginner,
  intermediate,
  advanced
}
mixin describable{
  String summaryLine();
}
abstract class studyItem{
  final String title;
  final sessionLevel level;
  studyItem(this.title,this.level);
  int estimatedMinutes();
  String summaryLine();
}
class conceptTopic extends studyItem with describable{
  final int exerciseCount;
  int _completedExercise=0;
  conceptTopic(String title, sessionLevel level, this.exerciseCount):super(title,level);

  @override
  int estimatedMinutes(){
    return exerciseCount*10;
  }
  @override
  String summaryLine() {
    return  "[Topic | ${level.name}] $title — "
        "$_completedExercise/$exerciseCount done "
        "(${estimatedMinutes()} min)\n";
  }
  int get completedExercise{
    return _completedExercise;
  }
  set completedExercise(int x){
    if(x<0 ||x>exerciseCount){
      print("Invalid number");
      return;
    }
    _completedExercise=x;
  }
  conceptTopic copywith({String? title, sessionLevel? level, int? exerciseCount, int? completedExercise
}){return conceptTopic(title??this.title , level??this.level, exerciseCount??this.exerciseCount
    )..completedExercise=completedExercise??this.completedExercise;
  }
}
class miniLab extends studyItem with describable{
  final int stepsCount;
  miniLab(
      String title,
      sessionLevel level,
      this.stepsCount):super(title,level);
  @override
  int estimatedMinutes(){
    return (stepsCount*5)+10;
  }
  @override
  String summaryLine() {
    return "[Lab   | ${level.name}] $title — "
        "$stepsCount steps "
        "(${estimatedMinutes()} min)\n";
  }
}
void main() {
  conceptTopic c1 = conceptTopic("Variables, Null Safety & Loops", sessionLevel.beginner, 3);
  c1.completedExercise = 2;
  conceptTopic c2 = conceptTopic("Functions, OOP & Mixins", sessionLevel.intermediate, 4);
  c2.completedExercise = 1;
  miniLab m1 = miniLab("Collections & Polymorphism Practice", sessionLevel.advanced, 4);
  c1 = c1.copywith(level: sessionLevel.intermediate);
  List<studyItem> item = [c1, c2, m1];
  int totalTimeBy(List<studyItem>item, bool Function(studyItem)predicate) {
    int total = 0;
    for (var i in item) {
      if (predicate(i)) {
        total += i.estimatedMinutes();
      }
    }
    return total;
  }
  bool again=false;
  do {
    print("Enter a new beginner topic title (or press Enter to skip):");
    String ?Title = stdin.readLineSync();
    print("Enter number of exercises: ");
    int exerciseCount=int.tryParse(stdin.readLineSync()??"")??0;
    if (Title != null && Title.isNotEmpty) {
      conceptTopic newTopic = conceptTopic(Title, sessionLevel.beginner, 2);
      item.add(newTopic);
    }
    print("Do you want to calculate again? (true/false):");
    again = stdin.readLineSync()! == "true";
  }while(again);
  Set<sessionLevel>levels = {};
  for (var i in item) {
    levels.add(i.level);
  }
  Map<sessionLevel,int>levelCount={};
  for(var i in item){
    if(levelCount.containsKey(i.level)){
      levelCount[i.level]=levelCount[i.level]!+1;
    }
    else{
      levelCount[i.level]=1;
    }
  }
  print("Filter items with estimated minutes >= ");
  int minMintes = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  int result =totalTimeBy(item,(i)=>i.estimatedMinutes() >= minMintes);

    print("\n--- All Study Items --- \n");
    for(var i in item){
      print(i.summaryLine());
    }
    print("--- Study Statistics ---");

    print("\nTotal minutes for items >= $minMintes min: $result");

    print("\nUnique levels: ${levels.map((level)=>level.name).toList()}");

    print("\nCounts by level:\n{");
    for(var entry in levelCount.entries){
      print("  SessionLevel.${entry.key.name}: ${entry.value}");
    }
    print("}");
}
