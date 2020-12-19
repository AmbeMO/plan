import 'package:flutter/material.dart';
import 'domains/workout.dart';


void main() => runApp(sportManagingApp());

class sportManagingApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'sport Managing App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(195, 154, 219, 1),
        textTheme: TextTheme(title: TextStyle(color: Colors.white))
      ),
      home: HomePage(),

    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(title: Text('Sport Managing'), leading: Icon(Icons.fitness_center),),
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget{

  final workouts = <Workout>[
    Workout(title: 'Test1',author: 'Milana',description: 'Test Workout1',level: 'Beginner'),
    Workout(title: 'Test2',author: 'Milana',description: 'Test Workout2',level: 'Intermidiate'),
    Workout(title: 'Test3',author: 'Milana',description: 'Test Workout3',level: 'Advanced'),
    Workout(title: 'Test4',author: 'Milana',description: 'Test Workout4',level: 'sub-master'),
    Workout(title: 'Test5',author: 'Milana',description: 'Test Workout5',level: 'Proffesional'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i){
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                child: ListTile(
                  title: Text(workouts[i].title),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}