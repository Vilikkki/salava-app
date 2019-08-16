import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:salava/views/downloaded_badges.dart';
import 'package:flutter/services.dart';

Future<void> shareImageFromUrl(String urlSuffix) async {
  String prefix = 'http://192.168.1.26:5000/';

  try {
    var request = await HttpClient().getUrl(Uri.parse(prefix + urlSuffix));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file('Shared Badge', 'badge.png', bytes, 'image/png',
        text: 'Share some additional information about this badge');
  } catch (e) {
    print('error: $e');
  }
}

Future<void> shareDownloadedImage(String id) async {
  String path = await findLocalPath();
  String addedPathData = '/obp/badge$id/badge$id.png';
  String finalPath = path + addedPathData;
  File file = File(finalPath);

  try {
    final Uint8List bytes = file.readAsBytesSync() as Uint8List;

    await Share.file('Badge$id png', 'badge$id.png', bytes, 'image/png',
        text: 'Share some additional information about this badge');
  } catch (e) {
    print('error: $e');
  }
}
