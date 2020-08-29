import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import './size_config.dart';
import './careerPages/doctor.dart';
import './careerPages/Pilot.dart';
import './careerPages/Architect.dart';
import './careerPages/Cricketer.dart';
import './careerPages/Archeologist.dart';

class HomeScreen extends StatefulWidget {
  static const route = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _options = ['Doctor', 'Pilot', 'Architect', 'Cricketer', 'Archeologist'];

  List _images = [
    'assets/icons/doctor.png',
    'assets/icons/pilot.png',
    'assets/icons/archi.png',
    'assets/icons/cricketer.png',
    'assets/icons/miners-coffee.png'
  ];

  List _careerPages = [
    DoctorPath.route,
    PilotPath.route,
    ArchitectPath.route,
    CricketerPath.route,
    ArcheologistPath.route
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'What do you want to be in your life ?',
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(32.0),
                height: MediaQuery.of(context).size.height,
                child: AnimationLimiter(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24.0,
                      crossAxisSpacing: 24.0,
                      childAspectRatio: 2 / 2,
                    ),
                    itemCount: _options.length,
                    itemBuilder: (ctx, index) =>
                        AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(_careerPages[index]);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 180.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    _images[index],
                                    height: 50.0,
                                    width: 50.0,
                                    fit: BoxFit.contain,
                                  ),
                                  Text(
                                    _options[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .copyWith(
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
