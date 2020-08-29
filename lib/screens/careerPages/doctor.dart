import 'package:agm/screens/careerPages/doctoRoadMap/Cardiology.dart';
import 'package:agm/screens/careerPages/doctoRoadMap/Dermatologist.dart';
import 'package:agm/screens/careerPages/doctoRoadMap/Gastroenternologist.dart';
import 'package:agm/screens/careerPages/doctoRoadMap/Gynecologist.dart';
import 'package:agm/screens/careerPages/doctoRoadMap/Opthalmologist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../size_config.dart';

class DoctorPath extends StatefulWidget {
  static const route = '/doctor-path';

  @override
  _DoctorPathState createState() => _DoctorPathState();
}

class _DoctorPathState extends State<DoctorPath>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> slideAnimation;
  Animation<double> opacityAnimation;

  List doctorcareer = [
    'Opthalmologist',
    'Dermatologist',
    'Cardiologist',
    'Gynecologists',
    'Endocrinologists',
    'Gastroenterologists',
    'Nephrologists',
    'Urologists',
    'Neurologists',
    'Psychiatrists',
    'Oncologists',
    'Radiologists',
    'Rheumatologists'
  ];
  List careerDescription = [
    'Ophthalmologists specialize in eye and vision care. They treat diseases and conditions of the eyes and can perform eye surgery.',
    'Dermatologists treat over 3,000 skin conditions, including acne, psoriasis, and skin cancer. They are trained to carry out skin grafts, laser treatments, the excision of lesions, and more',
    'A cardiologist specializes in diagnosing and treating diseases of the cardiovascular system. The cardiologist will carry out tests, and they may some do procedures, such as heart catheterizations, angioplasty, or inserting a pacemaker.',
    'Obstetrician/gynecologists (OB/GYNs) provide preventive care and disease management for female health conditions.',
    'Endocrinologists treat disorders and conditions that affect the endocrine system. This system involves various glands that make and release hormones in the body.',
    'Gastroenterologists focus on the digestive system. This includes the esophagus, pancreas, stomach, liver, small intestine, colon, and gallbladder.',
    'A nephrologist focuses on kidney care and conditions that affect the kidneys.',
    'Urologists treat conditions of the urinary tract in both males and females. They also focus on male reproductive health.',
    'A neurologist treats conditions of the nerves, spine, and brain.',
    'A psychiatrist is a doctor who treats mental health conditions. They may use counseling, medication, or hospitalization as part of their treatment.',
    'Oncologists treat cancer and its symptoms. During treatment for cancer, a person may have several types of healthcare professional in their care team.',
    'A radiologist specializes in diagnosing and treating conditions using medical imaging tests. They may read and interpret scans such as X-rays, MRIs, mammograms, ultrasound, and CT scans.',
    'A rheumatologist diagnoses and treats rheumatic diseases. These are autoimmune conditions that can affect the bones, joints, and muscles.'
  ];
  List averageSalary = [
    'INR 4.0 to 15 Lakhs',
    'INR 1 Lakh to 12 Lakhs',
    'INR 2 to 16 Lakhs',
    'INR 4.0 to 15 Lakhs',
    'INR 1 Lakh to 12 Lakhs',
    'INR 2 to 16 Lakhs',
    'INR 4.0 to 15 Lakhs',
    'INR 1 Lakh to 12 Lakhs',
    'INR 2 to 16 Lakhs',
    'INR 4.0 to 15 Lakhs',
    'INR 1 Lakh to 12 Lakhs',
    'INR 2 to 16 Lakhs',
    'INR 4.0 to 15 Lakhs'
  ];
  List jobOpportunity = [
    'Top hospitals such as AIIMS, MAX, and CMC etc.',
    'Private hospitals such as Apollo Clinic, Fortis Hospital, Columbia Asia, Nova Specialty, Hiranandani Hospital, Private clinics',
    ' Manipal, Lilavati Hospital & Research Centre, Tata Memorial Hospital, Government hospitals',
    'Top hospitals such as AIIMS, MAX, and CMC etc.',
    'Private hospitals such as Apollo Clinic, Fortis Hospital, Columbia Asia, Nova Specialty, Hiranandani Hospital, Private clinics',
    ' Manipal, Lilavati Hospital & Research Centre, Tata Memorial Hospital, Government hospitals',
    'Top hospitals such as AIIMS, MAX, and CMC etc.',
    'Private hospitals such as Apollo Clinic, Fortis Hospital, Columbia Asia, Nova Specialty, Hiranandani Hospital, Private clinics',
    ' Manipal, Lilavati Hospital & Research Centre, Tata Memorial Hospital, Government hospitals',
    'Top hospitals such as AIIMS, MAX, and CMC etc.',
    'Private hospitals such as Apollo Clinic, Fortis Hospital, Columbia Asia, Nova Specialty, Hiranandani Hospital, Private clinics',
    ' Manipal, Lilavati Hospital & Research Centre, Tata Memorial Hospital, Government hospitals',
    'Top hospitals such as AIIMS, MAX, and CMC etc.',
  ];
  List boxcolor = [
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff1abc9c),
  ];
  List expanded = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List roadmaps = [
    OpthalmologistRoadMap.route,
    DermatologistRoadMap.route,
    CardiologistRoadMap.route,
    GynecologistRoadMap.route,
    GastroenterologistRoadMap.route,
    OpthalmologistRoadMap.route,
    DermatologistRoadMap.route,
    CardiologistRoadMap.route,
    GynecologistRoadMap.route,
    GastroenterologistRoadMap.route,
    OpthalmologistRoadMap.route,
    DermatologistRoadMap.route,
    CardiologistRoadMap.route,
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
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Career options for \nDoctor',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: AnimationLimiter(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: careerDescription.length,
                      itemBuilder: (ctxx, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(roadmaps[index]);
                            },
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
                                    : MediaQuery.of(context).size.height * 0.23,
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
                                      doctorcareer[index],
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
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
