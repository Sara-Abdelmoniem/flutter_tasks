# 📚 Dart Learning Tracker – Console Application Challenge

## 📖 The Story: Your Personal Dart Learning Tracker

Imagine that you are a computer science student learning Dart through a series of sessions.

You've completed several sessions, covering different topics such as Variables, Null Safety, OOP, Collections, and Mixins.

However, you've started facing a problem:

- You can't keep track of all the topics you've studied.
- You don't know the difficulty level of each topic.
- You need to track how many exercises you've completed.
- You want to estimate how much time you need to finish studying everything.
- You need to know how many topics belong to each difficulty level.

You decide to build a simple **Dart Console Application** called **Dart Learning Tracker** to organize your learning journey!

Your task is to implement this application using the Dart concepts you've learned in Sessions 1, 2, and 3.

---

## 🎯 Problem Requirements

### 1. Organizing Study Levels (Enum – Session 3)

Every study item should have a difficulty level.

Create an enum called `SessionLevel` containing three levels:

- `beginner`
- `intermediate`
- `advanced`

### 2. Creating a Common Structure (Abstract Class – Session 2)

Your application tracks two types of study items:

- **Concept Topics:** Theoretical topics that require solving exercises.
- **Mini Labs:** Practical tasks that require completing several steps.

Since both represent study items, create an abstract class called `StudyItem` containing:

- `final String title`
- `final SessionLevel level`
- A constructor that initializes both properties.
- An abstract method `int estimatedMinutes()` that returns the estimated time required to complete the item.

### 3. Describing Study Items (Mixin – Session 3)

You want every study item to display a readable summary.

Create a mixin called `Describable` containing:

```dart
String summaryLine();
```

Both `ConceptTopic` and `MiniLab` should use this mixin.

### 4. Implementing Different Study Items (Inheritance & Polymorphism – Sessions 2 & 3)

Create two classes that extend `StudyItem` and use `Describable`.

#### A. ConceptTopic

A concept topic should contain:

- `final int exercisesCount`: Total number of exercises.
- A private field `_completedExercises` initialized to `0`.

Its `estimatedMinutes()` should calculate:

```text
Number of exercises × 10
```

Its `summaryLine()` should display:

- The item type.
- Its difficulty level.
- Its title.
- Completed exercises / Total exercises.
- Estimated minutes.

#### B. MiniLab

A mini lab should contain:

- `final int stepsCount`: Total number of steps.

Its `estimatedMinutes()` should calculate:

```text
(Number of steps × 5) + 10
```

Its `summaryLine()` should display:

- The item type.
- Its difficulty level.
- Its title.
- Number of steps.
- Estimated minutes.

### 5. Protecting Study Progress (Encapsulation – Session 2)

Students shouldn't be able to enter invalid progress values.

Inside `ConceptTopic`:

- Create a getter called `completedExercises`.
- Create a setter called `completedExercises`.
- Prevent the user from setting a negative number.
- Prevent the user from completing more exercises than the total `exercisesCount`.

If an invalid value is entered, print an appropriate warning and keep the previous value.

### 6. Updating Study Topics (copyWith – Session 3)

Sometimes you might want to update a topic's title or difficulty level without creating an entirely new topic manually.

Implement a `copyWith()` method in `ConceptTopic`.

It should allow updating:

- `title`
- `level`
- `exercisesCount`
- `completedExercises`

If a new value isn't provided, preserve the original value.

### 7. Managing All Study Items (Collections & Upcasting – Sessions 2 & 3)

Before interacting with the user, your application should start with **three predefined study items**.

Create the following objects:

#### Initial Data

**1. ConceptTopic**

| Property | Value |
|---|---|
| Class | `ConceptTopic` |
| Title | `Variables, Null Safety & Loops` |
| Level | `SessionLevel.beginner` |
| Exercises Count | `3` |
| Completed Exercises | `2` |

**2. ConceptTopic**

| Property | Value |
|---|---|
| Class | `ConceptTopic` |
| Title | `Functions, OOP & Mixins` |
| Level | `SessionLevel.intermediate` |
| Exercises Count | `4` |
| Completed Exercises | `1` |

**3. MiniLab**

| Property | Value |
|---|---|
| Class | `MiniLab` |
| Title | `Collections & Polymorphism Practice` |
| Level | `SessionLevel.advanced` |
| Steps Count | `4` |

**Important:** After creating these objects, use `copyWith()` to create an updated copy of the first topic, changing its level from `beginner` to `intermediate`. Use the updated object in your study items list.

Store all three objects in a:

```dart
List<StudyItem>
```

Remember that both subclasses should be stored as `StudyItem` objects (upcasting).

Your list should contain the updated first topic, the second topic, and the mini lab.

Any additional topic entered by the user should be added to this same list.


### 8. Calculating Study Time (Higher-Order Functions – Sessions 2 & 3)

You want to calculate the total estimated study time based on certain conditions.

Create a function:

```dart
int totalTimeBy(
  List<StudyItem> items,
  bool Function(StudyItem) predicate
)
```

The function should:

1. Receive a list of study items.
2. Receive a predicate that determines which items should be included.
3. Use `where()` to filter matching items.
4. Use `fold()` to calculate the total estimated minutes.

### 9. Analyzing Study Levels (Set & Map – Session 3)

Your tracker should provide some statistics.

- Use a `Set<SessionLevel>` to collect all unique difficulty levels available in the list.
- Use a `Map<SessionLevel, int>` to count how many study items belong to each difficulty level.

### 10. Getting Information from the User (Console Input & Null Safety – Session 1)

Your application should interact with the student.

#### First Prompt: Add a New Topic

Ask the student:

```text
Enter a new beginner topic title (or press Enter to skip):
```

- If the student enters a title, add a new `ConceptTopic` to the list.
- Give it a beginner level and 2 exercises.
- If the input is empty or null, skip adding the topic safely using null checks or `??`.

#### Second Prompt: Filter Study Items

Ask the student:

```text
Filter items with estimated minutes >=
```

- Read the input using `stdin.readLineSync()`.
- Convert it into an integer using `int.tryParse()`.
- If the input is invalid or null, use `0` as the default value.

Then use `totalTimeBy()` to calculate the total estimated time of items whose estimated minutes are greater than or equal to the entered value.

---

## 🖥️ Sample Run

The following is an example of how your application should behave.

```text
Enter a new beginner topic title (or press Enter to skip):
Dart Exception Handling

Filter items with estimated minutes >=
30

--- All Study Items ---

[Topic | intermediate] Variables, Null Safety & Loops — 2/3 done (30 min)

[Topic | intermediate] Functions, OOP & Mixins — 1/4 done (40 min)

[Lab   | advanced] Collections & Polymorphism Practice — 4 steps (30 min)

[Topic | beginner] Dart Exception Handling — 0/2 done (20 min)

--- Study Statistics ---

Total minutes for items >= 30 min: 100

Unique levels: [intermediate, advanced, beginner]

Counts by level:
{
  SessionLevel.intermediate: 2,
  SessionLevel.advanced: 1,
  SessionLevel.beginner: 1
}
```

*Note: The exact formatting can differ as long as the required functionality is implemented.*

---

## 🧠 Concepts You're Expected to Practice

| Concept | Where You'll Use It |
|---|---|
| Enum | `SessionLevel` |
| Mixin | `Describable` |
| Abstract Class | `StudyItem` |
| Inheritance | `ConceptTopic`, `MiniLab` |
| Polymorphism | `estimatedMinutes()` |
| Encapsulation | `_completedExercises` |
| Getter & Setter | Progress management |
| copyWith | Updating topics |
| Upcasting | `List<StudyItem>` |
| Higher-Order Function | `totalTimeBy()` |
| where & fold | Filtering and calculating |
| Set | Unique difficulty levels |
| Map | Counting study items |
| Null Safety | Optional topic input |
| tryParse | Minimum minutes input |

---

## ⭐ Bonus Challenges (Optional)

If you finish the main application, try these:

1. Add a feature that allows the student to mark more exercises as completed.
2. Display the study item with the highest estimated time.
3. Calculate the average estimated study time.
4. Allow the student to choose the difficulty level of the new topic.

---

## 🎓 Final Goal

Build a working console application that combines the concepts from Sessions 1, 2, and 3 into one practical project, rather than implementing each concept separately.

**Good luck, and happy coding! 🧡**

**OSC Flutter Team**
