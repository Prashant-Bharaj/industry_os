import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:industry_os/build_report.dart';
import 'package:industry_os/practice.dart';
import 'package:industry_os/registeration_ui.dart';
import 'package:industry_os/widgets/custom_form_field.dart';
import 'package:industry_os/widgets/responsive_ui.dart';

import 'build_daily_logs.dart';
import 'build_internal_audit_reports.dart';
import 'build_safety_meeting_loggers.dart';
import 'home_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IndustryOS',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        dividerTheme: DividerThemeData(color: Colors.black54),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey.shade900,
        dividerTheme: DividerThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>MyHomePage(title: 'Industry OS',),
        '/RegistrationScreen':(context)=>RegistrationScreen(title: 'Industry OS',),
        '/HomeScreen':(context)=>HomeScreen(title: 'Industry OS', key: null,),
        '/BuildReport':(context)=>BuildReport(),
        '/BuildDailyLogs':(context)=>BuildDailyLogs(),
        '/BuildSafetyMeetingLoggers': (context)=>BuildSafetyMeetingLoggers(),
        '/BuildInternalAuditReports':(context)=>BuildInternalAuditReports(),
      },
      // home: MyHomePage(title: 'Industry OS'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(
                      top: _large
                          ? _height / 30
                          : (_medium ? _height / 25 : _height / 20)),
                  child: Image.asset(
                    'assets/login.png',
                    height: _height / 3.5,
                    width: _width / 3.5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "ENTER EMAIL AND PASSWORD",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  hint: "email",
                  icon: Icons.email,
                  textEditingController: emailController,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  hint: "password",
                  icon: Icons.lock,
                  textEditingController: passwordController,
                ),
                SizedBox(height: _height / 12),
                RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/HomeScreen");
                    print("clicked on login");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: _large
                        ? _width / 4
                        : (_medium ? _width / 3.75 : _width / 3.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'LOG IN',
                    ),
                  ),
                ),
                Text("or"),
                FlatButton(
                  onPressed: (){
                    print("on register clicked");
                    Navigator.pushReplacementNamed(context, "/RegistrationScreen");
                  },
                  child: Text("Register", style: TextStyle(decoration: TextDecoration.underline, fontSize: 20,),
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
