import 'package:path_parsing/path_parsing.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ShowMeThatSVG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: networkSvg,
        ),
      ),
    );
  }
}

final Widget networkSvg = new SvgPicture.network(
  'http://192.168.1.26:5000/file/c/7/c/f/c7cf966285909b9f99c893208515f55d61d996fd339b0aeb9d9d7a9a88bf4f07.svg',
  semanticsLabel: 'A shark?!',
  placeholderBuilder: (BuildContext context) => new Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator()),
);
