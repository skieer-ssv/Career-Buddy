import 'package:agm/screens/goalsScreen.dart';
import 'package:agm/screens/homeScreen.dart';
import 'package:agm/screens/profileScreen.dart';
import 'package:agm/screens/searchScreen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: null,
        title: Text(
          'Career Buddy',
          style: Theme.of(context).textTheme.title.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: TabBarView(
          controller: _tabController,
          children: [
            HomeScreen(),
            SearchScreen(),
            //TODO, goals screen
            GoalScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelStyle: Theme.of(context).textTheme.button,
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.grey,
        tabs: <Widget>[
          Tab(
            text: 'Home',
          ),
          Tab(
            text: 'Search',
          ),
          Tab(
            text: 'Goals',
          ),
          Tab(
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
