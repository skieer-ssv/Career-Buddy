import './collegeData.dart';

class CareerPath {
  final String title;
  final String description;
  final List<CollegeData> colleges;
  final List<String> roadmap;
  CareerPath({this.title, this.roadmap, this.description, this.colleges});
}
