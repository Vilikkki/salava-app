import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TokenStorage {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get localFile async {
    final String path = await localPath;

    bool file = await File('$path/tokendata.txt').exists();

    if (file) {
      return File('$path/tokendata.txt');
    } else {
      final createFile = File('$path/tokendata.txt').create(recursive: false);

      return createFile;
    }
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
