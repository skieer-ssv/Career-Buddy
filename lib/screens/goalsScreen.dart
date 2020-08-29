import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//todo: reminder goal
class GoalScreen extends StatefulWidget {
  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  bool state = false;
  final taskController = TextEditingController();
  List<Goal> goals = [
    Goal(goal: 'physio', isDone: true),
    Goal(goal: 'vsio', isDone: false),
    Goal(goal: 'tysio', isDone: true),
  ];
  final date_time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (ctx) {
                return Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: taskController,
                        decoration: InputDecoration(
                          labelText: 'Enter Your Goal Here...',
                        ),
                        onSubmitted: (String val) {
                          taskController.text = val;
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                          String data = taskController.text;
                          goals.add(Goal(goal: data, isDone: false));
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        child: Text('submit'),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      DateFormat.yMMMd().format(date_time),
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  'Your Goals',
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  '${goals.length} goals',
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              Container(
                height: 300,
                padding: const EdgeInsets.all(22.0),
                child: ListView.builder(
                  itemCount: goals.length,
                  itemBuilder: (cont, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        goals.removeAt(index);
                        setState(() {});
                      },
                      child: CheckboxListTile(
                        value: goals[index].isDone,
                        onChanged: (value) {
                          goals[index].isDone = value;
                          setState(() {});
                        },
                        title: Text(
                          goals[index].goal,
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

/* children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_circle_outline),
                      color: (goals[index].isDone == true)
                          ? Colors.green
                          : Colors.black,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          goals[index].goal,
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(textBaseline: TextBaseline.alphabetic),
                        )),
                  ], */
class Goal {
  final String goal;
  bool isDone;
  Goal({this.goal, this.isDone});
}
