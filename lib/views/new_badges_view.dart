import 'package:flutter/material.dart';

class NewBadges extends StatefulWidget {
  @override
  _NewBadgesState createState() => _NewBadgesState();
}

class _NewBadgesState extends State<NewBadges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your new Badges'),
        ),
        body: Center(
          child: Container(
            child: Text('New Badges'),
          ),
        ));
  }
}
/*Center(
      child: Container(
        child: Text('New Badges'), */
