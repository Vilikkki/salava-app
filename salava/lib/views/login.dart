import 'package:flutter/material.dart';
import 'package:salava/helpers/login_and_first_token.dart';
import 'package:salava/classes/tokenStorage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _status = '';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "images/openbadgepassport_stacked_600x600.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _emailKey,
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (!value.contains('@') || value.isEmpty) {
                        return 'Not a valid email address';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _passwordKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please input password';
                      } else {
                        return null;
                      }
                    },
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Text('$_status'),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {
                    loginAndGetToken(
                            _emailController.text, _passwordController.text)
                        .then((result) {
                      if (result == true) {
                        Navigator.pushReplacementNamed(context, '/welcome');
                      } else {
                        setState(() {
                          this._status = 'Failed to login';
                        });
                      }
                    });
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () async {
                    readTokenData();
                  },
                  child: Text('File contents to console'),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () async {
                    TokenStorage deletion = new TokenStorage();
                    deletion.overWriteFile();
                  },
                  child: Text('Delete file contents'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<String> readTokenData() async {
  TokenStorage doIhaveOne = new TokenStorage();

  try {
    final file = await doIhaveOne.localFile;

    // Read the file.
    String contents = await file.readAsString();

    print('File contents: $contents');
    print(
        'If tokendata.txt\'s contents are NOT printed to console, the file has been overwritten or the token hasn\'t been fetched from the server');
    return contents;
  } catch (e) {
    return 'Something went wrong...';
  }
}

bool doIhaveToken(String fileContent) {
  if (fileContent.contains('Token')) {
    return true;
  } else {
    return false;
  }
}
