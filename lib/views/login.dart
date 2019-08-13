import 'package:flutter/material.dart';
import 'package:salava/helpers/login_and_first_token.dart';
import 'package:salava/classes/tokenStorage.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _status = '';

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

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
                FormBuilder(
                  key: _fbKey,
                  autovalidate: false,
                  child: Column(children: <Widget>[
                    FormBuilderTextField(
                      controller: emailController,
                      attribute: "loginname",
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelText: "Login"),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FormBuilderTextField(
                      obscureText: true,
                      controller: passwordController,
                      attribute: "password",
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelText: "Password"),
                      validators: [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: 33.0, vertical: 10.0),
                      child: Text("Login"),
                      onPressed: () {
                        setState(() => this._status = 'Logging in');
                        if (_fbKey.currentState.validate()) {
                          loginAndGetToken(
                                  emailController.text, passwordController.text)
                              .then((result) {
                            if (result) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/welcome');
                            } else {
                              setState(() => this._status = 'Failed to Login');
                            }
                          });
                        }
                      },
                    )
                  ]),
                ),
                Text('$_status'),
                SizedBox(
                  height: 15,
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
