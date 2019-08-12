import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TokenStorage {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/tokendata.txt');
  }

  Future<File> writeAccessAndRefreshToFile(String tokendata) async {
    final file = await localFile;

    // Write the file.
    return file.writeAsString(tokendata);
  }

  Future<File> overWriteFile() async {
    final file = await localFile;
    return file.writeAsString('');
  }
}
