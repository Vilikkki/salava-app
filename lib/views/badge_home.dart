import 'package:flutter/material.dart';
import 'package:salava/views/badge_view.dart';
import 'package:salava/views/new_badges_view.dart';
///////////////////////////////////////////////////////////////////

class BadgeHome extends StatefulWidget {
  _BadgeHomeState createState() => _BadgeHomeState();
}

class _BadgeHomeState extends State<BadgeHome> {
  int _currentIndex = 0;
  List<Widget> _views = [NewBadges(), BadgeList()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badges'),
      ),
      body: Center(child: _views.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            title: Text('New Badges'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text('Badges'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        //onTap: ,
      ),
    );
  }
}
