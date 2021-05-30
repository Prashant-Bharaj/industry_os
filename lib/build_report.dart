import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:industry_os/build_home_screen.dart';
import 'package:industry_os/home_ui.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:industry_os/widgets/custom_form_field.dart';
import 'package:industry_os/widgets/responsive_ui.dart';
import 'dart:math' as math;

class BuildReport extends StatefulWidget {
  @override
  _BuildReportState createState() => _BuildReportState();
}

class _BuildReportState extends State<BuildReport> {
  @override
  Widget build(BuildContext context) {
//TODO: 10 fields
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: BuildDrawer(),
        appBar: AppBar(
          title: Text("Report"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.input_sharp),
              ),
              Tab(icon: Icon(Icons.graphic_eq)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReportInput(),
            ReportOutput(),
          ],
        ),
      ),
    );
  }
}

class ReportInput extends StatefulWidget {
  @override
  _ReportInputState createState() => _ReportInputState();
}

class _ReportInputState extends State<ReportInput> {
  int n = 5;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 18,
              child: Column(
                children: [
                  Text(
                    "EMPLOYEE DETAILS",
                    style: TextStyle(fontSize: 20),
                  ),
                  CustomTextFormField(
                    hint: "name",
                    icon: Icons.person,
                  ),
                  CustomTextFormField(
                    hint: "department",
                    icon: Icons.account_balance,
                  ),
                  CustomTextFormField(
                    hint: "phone number",
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Text("DESCRIPTION OF INCIDENT", style: TextStyle(fontSize: 20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/2.2, child: CustomTextFormField(hint: "date",icon: Icons.date_range,)),
                      SizedBox(width: MediaQuery.of(context).size.width/2.2, child: CustomTextFormField(hint: "Time",icon: Icons.access_time_sharp,))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/2.2, child: CustomTextFormField(hint: "location",icon: Icons.location_on,)),
                      SizedBox(width: MediaQuery.of(context).size.width/2.2, child: CustomTextFormField(hint: "Time",icon: Icons.access_time_sharp,))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Text("INCIDENT DETAILS", style: TextStyle(fontSize: 20),),
                  Container(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Text("INCIDENT CAUSE", style: TextStyle(fontSize: 14),),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Text("FOLLOW UP RECOMMENDATIONS", style: TextStyle(fontSize: 14),),
                  Container(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Text("ADDITIONAL NOTES", style: TextStyle(fontSize: 14),),
                  Container(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 45,
            alignment: Alignment.center,
            width: 80,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("SUBMIT"),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class ReportOutput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 8.0,
              child: Column(
                children: [
                  Text(
                    "Number of incidents happen per month",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Sparkline(
                      data: generateRandomData(30),
                      pointColor: Colors.amber,
                      pointSize: 5.0,
                      fillColor: Colors.lightBlue,
                      lineColor: Colors.lightGreen.shade500,
                      pointsMode: PointsMode.all,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 8.0,
              child: Column(
                children: [
                  Text(
                    "Number of incidents happen per year",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Sparkline(
                      data: generateRandomData(365),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: Material(
          //     borderRadius: BorderRadius.circular(20),
          //     elevation: 8.0,
          //     child: Column(
          //       children: [
          //         Text(
          //           "Effect of incidents on company(monthly)",
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(18.0),
          //           child: Container(
          //             height: 400,
          //             child: Sparkline(
          //               data: generateRandomCumulative(20),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          //TODO: graph
        ],
      ),
    );
  }
}
