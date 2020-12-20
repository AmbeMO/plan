import 'package:flutter/material.dart';
import 'package:flutter_app1/components/workouts-list.dart';
import 'package:flutter_app1/domains/workout.dart';


class HomePage extends StatefulWidget {
   HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int sectionIndex = 0;

  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(title: Text('Sport Managing'), leading: Icon(Icons.fitness_center),),
        body: WorkoutsList(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              title: Text('My Workouts')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('find Workouts')
            )
          ],
          currentIndex: sectionIndex,
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          onTap: (int index){
            setState(() =>  sectionIndex = index);
          }
        ),
      ),
    );
  }
}

