import 'package:flutter/material.dart';
import 'package:salava/apiCalls/delete_tokenData.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text('Your profile'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Logout'),
              onPressed: () {
                deleteTokenData().then((result) {
                  if (result == true) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false);
                  } else {
                    print('Something went wrong...');
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
