import 'package:flutter/material.dart';
import '../../../widgets/roadMap.dart';

class PhysicianRoadMap extends StatefulWidget {
  static const route = '/physician-Road-Map';

  @override
  _PhysicianRoadMapState createState() => _PhysicianRoadMapState();
}

class _PhysicianRoadMapState extends State<PhysicianRoadMap>
    with SingleTickerProviderStateMixin {
  TabController tabBarController;
  //TODO, change the data for 2nd and 3rd way and also passing new parameters below
  final List<String> path1 = [
    '10+2 Under Graduation',
    'M.B.B.S.',
    'M.D.',
    'ddd'
  ];

  final List<String> duration1 = ['2', '4', '2', '2'];

  final List<String> ways = ['Way 1', 'Way 2', 'Way 3'];
  @override
  void initState() {
    tabBarController = TabController(
      length: ways.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Roadmap to Your \nCareer',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            DefaultTabController(
              length: ways.length,
              initialIndex: 0,
              child: TabBar(
                controller: tabBarController,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context).textTheme.button,
                unselectedLabelColor: Colors.grey,
                tabs: ways
                    .map((tab) => Tab(
                          text: tab,
                        ))
                    .toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(22.0),
              padding: const EdgeInsets.all(12.0),
              height: MediaQuery.of(context).size.height * 0.7,
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: tabBarController,
                children: <RoadMap>[
                  RoadMap(duration1, path1),
                  RoadMap(duration1, path1),
                  RoadMap(duration1, path1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
