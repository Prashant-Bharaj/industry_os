import 'package:flutter/material.dart';
import 'package:industry_os/widgets/custom_form_field.dart';
import 'package:industry_os/widgets/responsive_ui.dart';

class RegistrationScreen extends StatefulWidget {
  final String title;

  const RegistrationScreen({Key key, this.title}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left:_width/ 12.0,
                      right: _width / 12.0,
                      top: _height / 20.0),
                  child: Form(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hint: "first name",
                          icon: Icons.person,
                        ),
                        SizedBox(height: _height/60,),
                        CustomTextFormField(
                          hint: "last name",
                          icon: Icons.person,
                        ),
                        SizedBox(height: _height/60,),
                        CustomTextFormField(
                          hint: "email",
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email,
                        ),
                        SizedBox(height: _height/60,),
                        CustomTextFormField(
                          hint: "mobile number",
                          keyboardType: TextInputType.number,
                          icon: Icons.phone,
                        ),
                        SizedBox(height: _height/60,),
                        CustomTextFormField(
                          hint: "password",
                          icon: Icons.lock,
                        ),
                        SizedBox(height: _height / 12),

                        RaisedButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          onPressed: () {
                            print("clicked on Register");
                            Navigator.pushReplacementNamed(context, "/HomeScreen");
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
                              'Register',
                            ),
                          ),
                        ),
                      ],
                    ),
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
