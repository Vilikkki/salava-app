import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('images/obp_kuutio.png'),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.of(context).pushNamed('/badgeHome');
                    print('Card tapped.');
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                          child: Icon(Icons.cloud_upload),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Text(
                            'Fetch Badges',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () async {
                    //printFilePaths();
                    Navigator.of(context).pushNamed('/downloaded');
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                          child: Icon(Icons.storage),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Text(
                            'Downloaded Badges',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                          child: Icon(Icons.settings),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Image(
                  image: AssetImage('images/OBP_logo_orange_rgb_m.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
