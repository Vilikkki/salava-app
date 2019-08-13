import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> setupDownloadTask(String url, Future<String> filePath, int id,
    String badgeName, String issuerName, String expiry, String fileType) async {
  final finalFilePath = await filePath;
  print(badgeName);
  print(finalFilePath);
  final filename = finalFilePath + 'data$id.txt';

  new File(filename).writeAsString(
      badgeName + ',' + issuerName + ',' + expiry + ',' + fileType);

  final String preFix = 'http://192.168.1.26:5000/';
  final taskID = await FlutterDownloader.enqueue(
    fileName: 'badge$id' + svgOrPng(url),
    url: preFix + url,
    savedDir:
        finalFilePath, //'the path of directory where you want to save downloaded files',
    showNotification:
        true, // show download progress in status bar (for Android)
    openFileFromNotification:
        true, // click on notification to open downloaded file (for Android)
  );

  return taskID;
}

void executeDownloadTask() async {
  await FlutterDownloader.loadTasks();
}

Future<String> _findLocalPath() async {
  final directory = await getExternalStorageDirectory();
  return directory.path;
}

void cancelDownload() async {
  await FlutterDownloader.cancel();
}

void pauseDownload() async {
  await FlutterDownloader.pause();
}

void resumeDownload() async {
  String newTaskId = await FlutterDownloader.resume();
  final taskId = newTaskId;
}

void retryDownload() async {
  String newTaskId = await FlutterDownloader.retry();
  final taskId = newTaskId;
}

Future<bool> openDownloadedFile(_) {
  return FlutterDownloader.open();
}

void delete() async {
  await FlutterDownloader.remove(shouldDeleteContent: true);
}

String svgOrPng(String filePath) {
  if (filePath.contains('.svg')) {
    return '.svg';
  } else {
    return '.png';
  }
}

Future<String> setupDownloadDirectory(int id) async {
  String dir = await _findLocalPath();
  String finalDir = dir + '/obp/badge$id/';

  final getFinalDir = Directory(finalDir);
  bool hasExisted = await getFinalDir.exists();
  if (!hasExisted) {
    getFinalDir.create(recursive: true);
  }

  print('The following directory path has been created: $finalDir');

  return finalDir;
}

deleteDirectory(int id) async {
  String dir = await _findLocalPath();
  String finalDir = dir + '/obp/badge$id/';
  final getFinalDir = Directory(finalDir);
  bool exists = await getFinalDir.exists();

  if (exists) {
    getFinalDir.delete(recursive: true);
    print('The following file has been deleted: $finalDir');
  }
}
