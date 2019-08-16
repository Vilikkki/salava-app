import 'package:flutter/material.dart';
import 'package:salava/apiCalls/fetch_badge_info.dart';
import 'package:salava/classes/badgeInfo.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:salava/helpers/badge_download.dart';
import 'package:salava/apiCalls/delete_badge.dart';
import 'package:salava/helpers/sharing.dart';

class InfoViewEnhanced extends StatefulWidget {
  const InfoViewEnhanced({Key key, this.badgeId, this.badgeImageDownloadUrl})
      : super(key: key);
  final int badgeId;
  final String badgeImageDownloadUrl;

  @override
  _InfoViewEnhancedState createState() => _InfoViewEnhancedState();
}

class _InfoViewEnhancedState extends State<InfoViewEnhanced> {
  int _id;
  String _imageDownloadUrl;

  @override
  initState() {
    super.initState();
    _id = widget.badgeId;
    _imageDownloadUrl = widget.badgeImageDownloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BadgeInfo>(
      future: _info(_id),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Scaffold(
            body: Center(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Fetching Badge Info...',
                    style: TextStyle(fontSize: 25),
                  ),
                  CircularProgressIndicator()
                ],
              ),
            )),
          );

        return Scaffold(
          appBar: AppBar(
            title: Text('Badge Details'),
            actions: <Widget>[
              IconButton(
                icon: Icon(lista[0].iconi),
                onPressed: () {
                  print(findContent(snapshot.data.content).name);
                  showAlertDialogDownload(
                    context,
                    _imageDownloadUrl,
                    setupDownloadDirectory(_id),
                    _id,
                    findContent(snapshot.data.content).name,
                    findContent(snapshot.data.content).issuerContentName,
                    snapshot.data.assertion.expires,
                    extractFileType(_imageDownloadUrl),
                  );
                },
              ),
              SizedBox(
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                child: IconButton(
                  icon: Icon(lista[1].iconi),
                  onPressed: () {
                    print(_imageDownloadUrl);
                    showAlertDialogDelete(context, _id);
                  },
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  svgOrPngCA(findContent(snapshot.data.content).imageFile),
                  Text(
                      'Views: ${snapshot.data.viewCount}'), //Wrong API being used for view count... This one gives a null value...
                  Text(
                    findContent(snapshot.data.content).name,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            shareImageFromUrl(_imageDownloadUrl);
                          }),
                    ],
                  ),
                  Divider(
                    indent: 8,
                    endIndent: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Issued by:'),
                              Text('Issued on:'),
                              Text('Expires on:'),
                              Text('Earner:')
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(findContent(snapshot.data.content)
                                  .issuerContentName),
                              Text(snapshot.data.assertion.issuedOn),
                              Text(snapshot.data.assertion.expires),
                              Text(snapshot.data.firstName +
                                  ' ' +
                                  snapshot.data.lastName)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Criteria',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 25),
                  Html(
                      data: findContent(snapshot.data.content).criteriaContent),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}

class Action {
  Action({this.action, this.iconi});
  final String action;
  final IconData iconi;
}

List<Action> lista = <Action>[
  Action(action: 'Download Badge', iconi: Icons.file_download),
  Action(action: 'Delete Badge', iconi: Icons.delete)
];

String extractFileType(String filePath) {
  List<String> splitter = filePath.split('.');
  String fileType = splitter[1];

  return fileType;
}

Widget svgOrPngCA(String filePath) {
  if (filePath.contains('.svg')) {
    return new CircleAvatar(
      radius: 100,
      backgroundImage: AssetImage('images/sadface.png'),
    );
  } else {
    return new CircleAvatar(
      radius: 100,
      backgroundImage: NetworkImage('http://192.168.1.26:5000/' + filePath),
    );
  }
}

Content findContent(List<Content> contentList) {
  for (int i = 0; i < contentList.length; i++) {
    if (contentList[i].defaultLanguageCode == contentList[i].languageCode) {
      return contentList[i];
    }
  }
  return null;
}

showAlertDialogDownload(
    BuildContext context,
    String url,
    Future<String> filePath,
    int id,
    String badgeName,
    String issuerName,
    String expiry,
    String fileType) {
  Widget noButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      deleteDirectory(id);
      Navigator.of(context).pop();
    },
  );
  Widget yesButton = FlatButton(
    child: Text("Yes"),
    onPressed: () async {
      setupDownloadTask(
          url, filePath, id, badgeName, issuerName, expiry, fileType);
      Navigator.of(context).pop();
    },
  );

  // AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Download this Badge?"),
    content: Text(
        "The Badge will be downloaded and stored in your phone's memory for offline use."),
    actions: [
      noButton,
      SizedBox(width: 170),
      yesButton,
    ],
  );

  // Build method
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogDelete(BuildContext context, int badgeID) {
  Widget noButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget yesButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      deleteBadge(badgeID);
      Navigator.of(context).pop();
    },
  );

  //AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Are you sure you want to delete this Badge?"),
    content: Text("The Badge will be removed completely from your collection."),
    actions: [
      noButton,
      SizedBox(width: 170),
      yesButton,
    ],
  );

  // Build method
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<BadgeInfo> _info(int id) async {
  BadgeInfo badgeInfo = await fetchBadgeInfo(id);

  print('BadgeInfoView: BadgeInfo created');

  return badgeInfo;
}
