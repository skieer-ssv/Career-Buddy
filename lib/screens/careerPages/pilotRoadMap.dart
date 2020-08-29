import 'package:flutter/material.dart';
import '../../widgets/roadMap.dart';

class CommercialRoadMap extends StatefulWidget {
  static const route = '/Commercial-Road-Map';

  @override
  _CommercialRoadMapState createState() => _CommercialRoadMapState();
}

class _CommercialRoadMapState extends State<CommercialRoadMap>
    with SingleTickerProviderStateMixin {
  TabController tabBarController;
  //TODO, change the data for 2nd and 3rd way and also passing new parameters below
  final List<String> path1 = [
    '10+2 Under Graduation',
    'Graduation in non-Science',
    'NIOS Test',
    'Flying School Tests',
    'Training in Flying School',
    'Apply for flying license'
  ];
  final List<String> path2 = [
    '10 +2 Under Graduation',
    'Graduation in Science',
    'Flying School Tests',
    'Training in Flying School',
    'Apply for flying license'
  ];

  final List<String> duration1 = ['2', '4', '2', '2', '1', '1'];

  final List<String> ways = ['Way 1', 'Way 2'];
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
                  RoadMap(duration1, path2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
