import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import './doctoRoadMap/physicianRoadMap.dart';

class ArchitectPath extends StatefulWidget {
  static const route = '/Architect-path';

  @override
  _ArchitectPathState createState() => _ArchitectPathState();
}

class _ArchitectPathState extends State<ArchitectPath>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> slideAnimation;
  Animation<double> opacityAnimation;

  List pilotcareer = ['Commercial', 'Air Force'];
  List careerDescription = [
    'Commercial pilots are involved in unscheduled flight activities, such as aerial application, charter flights, aerial photography, and aerial tours.',
    'Air force pilots perform navigation, surveillance reconnaissance, and rescue missions.'
  ];
  List averageSalary = ['INR 1.5 Lakh per month', 'INR 8.32 Lakh a year'];
  List jobOpportunity = ['Kingfisher', 'Air India', 'Spicejet', 'Indigo'];
  List boxcolor = [
    Color(0xff1abc9c),
    Color(0xff2ecc71),
  ];
  List expanded = [
    false,
    false,
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    slideAnimation = Tween<Offset>(
      begin: Offset(0, -0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    opacityAnimation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    super.initState();
  }

  void playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Career options for \nPilot',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(PhysicianRoadMap.route);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: AnimationLimiter(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: careerDescription.length,
                        itemBuilder: (ctxx, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: Duration(
                              milliseconds: 500,
                            ),
                            child: SlideAnimation(
                              verticalOffset: 150.0,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 32.0,
                                  vertical: 12.0,
                                ),
                                padding: EdgeInsets.all(16.0),
                                width: MediaQuery.of(context).size.width,
                                height: expanded[index] == true
                                    ? MediaQuery.of(context).size.height * 0.35
                                    : MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: boxcolor[index],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      pilotcareer[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    Text(
                                      careerDescription[index],
                                      maxLines: expanded[index] ? 10 : 3,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                          ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    if (expanded[index])
                                      SlideTransition(
                                        position: slideAnimation,
                                        child: FadeTransition(
                                          opacity: opacityAnimation,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Average Salary :',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body2
                                                    .copyWith(
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                averageSalary[index],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body2
                                                    .copyWith(
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    if (expanded[index])
                                      SlideTransition(
                                        position: slideAnimation,
                                        child: FadeTransition(
                                          opacity: opacityAnimation,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Job Opportunities :',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body2
                                                    .copyWith(
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                jobOpportunity[index],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body2
                                                    .copyWith(
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            expanded[index] = !expanded[index];
                                            playAnimation();
                                          });
                                        },
                                        icon: Icon(
                                          expanded[index]
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 35.0,
                                        ),
                                        label: Text(
                                          expanded[index]
                                              ? 'see less'
                                              : 'see more',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button
                                              .copyWith(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
