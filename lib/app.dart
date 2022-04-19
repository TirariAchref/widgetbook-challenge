// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

/// The app.
class App extends StatefulWidget {
  /// Creates a new instance of [App].
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  final WidgetbookApi wb = WidgetbookApi();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  late String? _name;
  late String? _result = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Interview Challenge'),
        ),
        body: Form(
          key: _keyForm,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                  child: TextFormField(
                    onSaved: (text) {
                      _name = text;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Put your Name";
                      } else {
                        // ignore: omit_local_variable_types
                        bool NameValid =
                            RegExp(r'^[a-zA-Z ]+$').hasMatch(value);
                        if (!NameValid) {
                          return "Name not valide";
                        }
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Your Name...',
                      labelStyle: const TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Enter your Name...',
                      hintStyle: const TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (_keyForm.currentState!.validate()) {
                                  _keyForm.currentState!.save();
                                  try {
                                    _result = await wb.welcomeToWidgetbook(
                                        message: _name!.toString());
                                    print(_result);
                                  } catch (e) {
                                    _result = "Error occurs ";
                                    print("error");
                                  }
                                  setState(() {});
                                }
                              },
                              child: Container(
                                width: 150,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 2, 154, 255),
                                elevation: 3,
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text(_result.toString())]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
