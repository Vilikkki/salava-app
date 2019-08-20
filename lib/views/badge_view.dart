import 'package:flutter/material.dart';
import 'package:salava/apiCalls/fetch_badges.dart';
import 'package:salava/classes/badge.dart';
import 'package:salava/widgets/badgeButton.dart';
import 'package:salava/views/badge_info_view_enhanced.dart';
import 'package:salava/classes/badgeSearch.dart';

class BadgeList extends StatefulWidget {
  @override
  _BadgeListState createState() => _BadgeListState();
}

class _BadgeListState extends State<BadgeList> {
  var badgeFunc = fetchBadges();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Badge>>(
      future: badgeFunc,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            child: Column(
              children: <Widget>[
                Text(
                  'Fetching Your Badges...',
                  style: TextStyle(fontSize: 25),
                ),
                CircularProgressIndicator()
              ],
            ),
          ));

        return Scaffold(
          appBar: AppBar(
            title: Text('Your Badges'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: BadgeSearch(fetchBadges()));
                },
              )
            ],
          ),
          body: ListView(
            children: snapshot.data
                .map((badge) => Card(
                        child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      leading: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoViewEnhanced(
                                        badgeId: badge.id,
                                        badgeImageDownloadUrl: badge.imageFile,
                                        badgePrivacySetting: badge.visibility,
                                      )),
                            );
                          },
                          child: svgOrPng(badge.imageFile)),
                      title: Text(badge.name),
                      subtitle: Text(badge.issuerContentName),
                      trailing: IconiButton(
                        badgeVisibility: badge.visibility,
                      ),
                      isThreeLine: true,
                    )))
                .toList(),
          ),
        );
      },
    );
  }
}

Widget svgOrPng(String filePath) {
  if (filePath.contains('.svg')) {
    return new Image.asset(
      'images/sadface.png',
    );
  } else {
    return new Image.network('http://192.168.1.26:5000/' + filePath);
  }
}
