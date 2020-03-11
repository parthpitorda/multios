import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/HomeScreen.dart';
import 'package:multios/utils/Utils.dart';
import 'package:http/http.dart' as http;

TextEditingController idContr;
TextEditingController passContr;

StreamSubscription<CollectionReference> subscription;
List<DocumentSnapshot> documentShanshot;
List<String> userList = new List();
bool _isButtonDisabled = false;

Firestore firestore;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
          centerTitle: true,
        ),
        body: Scrollbar(
          child: Column(
            children: <Widget>[
              Stepper(
                steps: _mySteps(),
                currentStep: this._currentStep,
                onStepTapped: (step) {
                  setState(() {
                    this._currentStep = step;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    switch (_currentStep) {
                      case 0:
                        if (idContr.text.isNotEmpty) {
                          this._currentStep = this._currentStep + 1;
                          _isButtonDisabled = false;
                        } else {
                          _isButtonDisabled = false;
                          Utils.showToast("Please enter user name..");
                        }
                        break;

                      case 1:
                        if (passContr.text.isNotEmpty) {
                          _isButtonDisabled = true;
                        } else {
                          _isButtonDisabled = false;
                          Utils.showToast("Please enter pass..");
                        }
                        break;
                      default:
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (this._currentStep > 0) {
                      this._currentStep = this._currentStep - 1;
                    } else {
                      this._currentStep = 0;
                    }
                  });
                },
              ),
              RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: _isButtonDisabled ? getLogin(context) : null,
                child: new Text("Login"),
              ),
            ],
          ),
        ));
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        subtitle: Text('ex:- Jhon paul'),
        title: Text('User Name'),
        content: Utils.getTextView("User Name..", idContr, false, true, true),
        isActive: _currentStep > 0,
      ),
      Step(
        title: Text('Password'),
        content:
            Utils.getTextView("Enter Pass..", passContr, true, false, false),
        isActive: _currentStep > 0,
      ),
    ];
    return _steps;
  }

  @override
  void initState() {
    super.initState();

    idContr = TextEditingController();
    passContr = TextEditingController();

    firestore = Firestore.instance;

    firestore.collection("baby").getDocuments().then((result) => {
          documentShanshot = result.documents,
          for (var i = 0; i < documentShanshot.length; i++)
            {
              print(">>>>>>>>" + documentShanshot[i].documentID),
              userList.add(documentShanshot[i].documentID)
            }
        });
  }

  @override
  void dispose() {
    subscription.cancel();
    idContr.dispose();
    passContr.dispose();
    super.dispose();
  }
}

getLogin(BuildContext context) {
  if (idContr.text.isNotEmpty && passContr.text.isNotEmpty) {
    if (userList.contains(idContr.text)) {
      Utils.showToast("User Already regester!..");
      idContr.clear();
    } else {
      firestore
          .collection('baby')
          .document(idContr.text)
          .setData({"name": idContr.text, "votes": int.parse(passContr.text)})
          .then((result) => {
                Navigator.pop(context),
                Utils.showToast("Login Successfully.."),
                Utils.navigateToSubPage(context, HomeScreen()),
                Utils.saveDataToPrefBoolen(Utils.PREF_ISLOGIN, true),
                Utils.saveDataToPrefString(
                    Utils.PREF_NAME, idContr.text.toString()),
                idContr.clear(),
                passContr.clear(),
              })
          .catchError((err) => print(err));
    }
  }
}
