import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/todopage.dart';

void main() async {
  await Hive.initFlutter();

  // open box
  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // String name = "Sabin  Dahal";
  // int age = 23;
  // double pi = 3.14159;
  // bool isBeginer = true;

/*
Basic  Math Operators
1 =1 -> 2,  add
4-1 -> 3,  subtact
2*3 -> 6,  multiply
8/4 -> 2,  divide
9%4 -> 1,  reminder
++ increaded by 1
-- decreaded by 1

Comprasion operators
 5==5-> true, equal to 
 2 != 3 -> true, not equal to
 3>2 ->true , greater then
 3<2 ->false , less then
 5>=5 -> true, greater then or equal to
 3<=7 -> true, less then or equal to

LOgical Operators

AND operator, returns true if both sides are ture 
isBeginner && ( age< 18) -> return true

OR operator, returns true if one side is true
isBeginner || ( age< 18) -> return true

NOT operator, reverses the result
!isBeginner -> return false

*/
/*
-------------------------------------------------------------------------------------
Controlflow

if(condition) {
  do something
}

if(conditon){
do something
}else {
do something else
}


if(){
  do something
} else if (another condition){
  do something else
}


switch case

switch (expression) {
  case value:
  break;
  default:
}


for loop
 imagine you have a box of 10 diffrent colored crayons and you want to draw a 
 circle with each onb. intrested of saying:

 "Draw a circle with the 1st crayon, the draw a circle with the 2nd cryayon,etc.."

 It's much easier to say:
  " for each caryon in the box , draw a circle ."

  for( initialization ; condition  ; itteration){

  }
 break -> break out of loop
 continue -> skip this current iteration

in a for loop, we have to specify the number of time of loop.
if you don't know how many times to loop, you can use a while loop tp know
 looping until a certain condition is met

while(condition){

}
-------------------------------------------------------------------------------------

Functions

we just looked at some cool blocks of coe that gets things done!
we can organised these blocks of code into functions so that we can reuse them 
easily


'void' means that the function resturns nothing. Shortly we will look at functions 
that do return something. THis one for now just executes the code in the function

//basic function 
void greet(){
  print("hello");
}
  //function with parameters
  void greet(String name){
    print("hello " + name);
  }

// function with return type
int add( inta a, int b){
  int  sum = a+b;
  return sum;
}
*/

/*

Data Structures 
 List : ordered collection of elements can have duplicates
 Set : unordered collection of elements cannot have duplicates
 Map : unordered collection and stores elements as a list of key-value pairs

*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ToDoPage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
