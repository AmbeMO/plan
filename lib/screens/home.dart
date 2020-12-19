import 'package:flutter/material.dart';
import 'package:flutter_app1/domains/workout.dart';


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
    Workout(title: 'Test4',author: 'Milana',description: 'Test Workout4',level: 'Sub-master'),
    Workout(title: 'Test5',author: 'Milana',description: 'Test Workout5',level: 'Master'),
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
                decoration: BoxDecoration(color: Color.fromRGBO(195, 154, 219, 0.8) ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.fitness_center, color: Theme.of(context).textTheme.title.color),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(width: 1, color: Colors.white24))
                    ),
                  ),
                  title: Text(workouts[i].title, style: TextStyle(color: Theme.of(context).textTheme.title.color, fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).textTheme.title.color),
                  subtitle: subtitle(context, workouts[i]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout){
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch(workout.level){
    case 'Beginner':
      color = Colors.lightGreen;
      indicatorLevel = 0.20;
      break;

    case 'Intermidiate':
      color = Colors.green;
      indicatorLevel = 0.40;
      break;

    case 'Advanced':
      color = Colors.orange;
      indicatorLevel = 0.60;
      break;

    case 'Sub-master':
      color = Colors.yellow;
      indicatorLevel = 0.80;
      break;

    case 'Master':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).textTheme.title.color,
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color)
        ),
      ),
      SizedBox(width: 10),
      Expanded(
          flex: 3,
          child: Text(workout.level, style: TextStyle(color: Theme.of(context).textTheme.title.color))
      )
    ],
  );
}