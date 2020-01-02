import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/components/buttons/PrimaryButton.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/fileLocation.dart';
import 'package:test_app/shared/const/routes.dart';
import 'package:test_app/shared/const/textStyleOptions.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final AuthService _authService = AuthService(firebaseAuth: FirebaseAuth.instance);

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((FirebaseUser user) {
      if (user == null) {
        Navigator.pushNamed(context, Routes.HOME);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(FileLocations.BACKGROUND_SKY),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Flutter TestApp'),
          leading: Container(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () async {
                await _authService.signOut();
              },
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 100.0
              ),
              height: 250.0,
              child: Image.asset(FileLocations.LOGO),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0.0),
              child: Text(
                AppLocalizations.of(context).translate('SUCCESSFUL_LOGIN'),
                style: TextStyleOptions.loginTitle,
                textAlign: TextAlign.center,
              )
            ),
            FutureBuilder<FirebaseUser>(
              future: _authService.getCurrentUser(),
              builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                if (snapshot.hasData == false) {
                  return const CircularProgressIndicator();
                }
                return Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    '${AppLocalizations.of(context).translate('EMAIL')}: ${snapshot.data.email}',
                    style: TextStyleOptions.loginText,
                    textAlign: TextAlign.center,
                  )
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(40.0),
              child: PrimaryButton(
                color: const Color(CustomColors.WHITE),
                buttonText: AppLocalizations.of(context).translate('BACK_TO_HOME'),
                onPressed: () async {
                  await _authService.signOut();
                },
              ),
            )
          ],
        )
      ),
    );
  }
}