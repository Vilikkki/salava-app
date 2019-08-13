import 'package:flutter/material.dart';

class IconiButton extends StatefulWidget {
  const IconiButton({Key key, this.badgeVisibility}) : super(key: key);

  final String badgeVisibility;

  @override
  _IconiButtonState createState() => _IconiButtonState();
}

class _IconiButtonState extends State<IconiButton> {
  int _key;

  Map<int, IconData> _privacyIconMap1;

  @override
  void initState() {
    super.initState();
    setState(() {
      _key = intFromString(widget.badgeVisibility);
    });

    _privacyIconMap1 = {
      1: Icons.public,
      2: Icons.supervised_user_circle,
      3: Icons.lock
    };
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(_privacyIconMap1[_key]), onPressed: switchIcon);
  }

  switchIcon() {
    setState(() {
      if (_key < 3) {
        _key++;
      } else {
        _key = 1;
      }
    });
  }
}

int intFromString(String visibility) {
  int key;
  if (visibility == 'public') {
    key = 1;
  } else if (visibility == 'internal') {
    key = 2;
  } else {
    key = 3;
  }
  return key;
}
