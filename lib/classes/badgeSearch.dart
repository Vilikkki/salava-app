import 'package:flutter/material.dart';
import 'package:salava/classes/badge.dart';
import 'package:salava/widgets/badgeButton.dart';
import 'package:salava/views/badge_info_view_enhanced.dart';

class BadgeSearch extends SearchDelegate<Badge> {
  Future<List<Badge>> badgeList;

  BadgeSearch(this.badgeList);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder<List<Badge>>(
      future: badgeList,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: Text('No results. Search by Badge name.'),
          );

        final results = snapshot.data.where((badge) =>
            badge.name.toLowerCase().contains(query) ||
            badge.issuerContentName.toLowerCase().contains(query));
        return ListView(
          children: results
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
