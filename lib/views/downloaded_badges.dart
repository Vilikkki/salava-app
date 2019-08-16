import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:salava/helpers/sharing.dart';

class DownloadedBadges extends StatefulWidget {
  @override
  _DownloadedBadgesState createState() => _DownloadedBadgesState();
}

class _DownloadedBadgesState extends State<DownloadedBadges> {
  // Right data is found by using ListView builders index
  List<FileSystemEntity> filePathList;

  List<String> badgeNumberList;

  List<String> badgeDataList;

  List<String> justPaths;

  List<List<String>> separatedData;

  @override
  void initState() {
    super.initState();

    doesObpDirExist().then((result) {
      if (result) {
        getFilePaths().then((pathList) {
          setState(() {
            filePathList = pathList;
            badgeNumberList = filePathNumbers(filePathList);
            justPaths = entitiesToStrings(filePathList);
            badgeDataList = readDataFiles(justPaths, badgeNumberList);
            separatedData = separateDataString(badgeDataList);
          });
        });
      } else {
        filePathList = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (filePathList == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Downloaded Badges'),
        ),
        body: Center(
          child: Text('No Downloaded Badges'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Downloaded Badges'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: filePathList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  svgOrPngDownloadedView(justPaths[index],
                      badgeNumberList[index], separatedData[index][3]),
                  Text(separatedData[index][0]),
                ],
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('Issued by:'),
                    Text('Expires on:'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(separatedData[index][1]),
                    Text(separatedData[index][2]),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    shareDownloadedImage(badgeNumberList[index]);
                  })
            ],
          ));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.black,
        ),
      ),
    );
  }
}

Future<List<FileSystemEntity>> getFilePaths() async {
  String path = await findLocalPath();
  String finalPath = path + '/obp/';

  final dir = Directory(finalPath);

  List<FileSystemEntity> filePathList =
      await dir.list(recursive: false, followLinks: false).toList();

  return filePathList;
}

List<String> filePathNumbers(List<FileSystemEntity> filePathList) {
  List<String> numbers = new List();

  for (int i = 0; i < filePathList.length; i++) {
    String filePath = filePathList[i].path;

    List<String> extractNumber = filePath.split('badge');

    String number = extractNumber[1];

    numbers.add(number);
  }

  return numbers;
}

List<String> entitiesToStrings(List<FileSystemEntity> list) {
  List<String> stringList = new List();

  for (int i = 0; i < list.length; i++) {
    String str = list[i].path;

    stringList.add(str);
  }
  return stringList;
}

Future<String> findLocalPath() async {
  final directory = await getExternalStorageDirectory();
  return directory.path;
}

Future<bool> doesObpDirExist() async {
  String path = await findLocalPath();
  String finalPath = path + '/obp/';

  final dir = Directory(finalPath);
  bool exists = await dir.exists();

  if (exists) {
    return true;
  } else {
    return false;
  }
}

List<String> readDataFiles(List<String> paths, List<String> numberList) {
  List<String> dataList = new List();

  for (int i = 0; i < paths.length; i++) {
    File file = File(paths[i] + '/data${numberList[i]}.txt');
    String contents = file.readAsStringSync();
    dataList.add(contents);
  }

  return dataList;
}

List<List<String>> separateDataString(List<String> dataList) {
  List<List<String>> separatedData = new List();

  for (int i = 0; i < dataList.length; i++) {
    List<String> separator = dataList[i].split(',');
    separatedData.add(separator);
  }
  return separatedData;
}

Widget svgOrPngDownloadedView(String path, String number, String data) {
  if (data == 'svg') {
    return new Image.asset(
      'images/sadface.png',
      width: 100,
      height: 100,
    );
  } else {
    return Image.file(
      new File(path + '/badge$number.$data'),
      width: 100,
      height: 100,
    );
  }
}
