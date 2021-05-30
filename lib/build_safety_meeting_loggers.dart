import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:industry_os/home_ui.dart';
import 'package:industry_os/widgets/custom_form_field.dart';

class BuildSafetyMeetingLoggers extends StatefulWidget {
  @override
  _BuildSafetyMeetingLoggersState createState() =>
      _BuildSafetyMeetingLoggersState();
}

class _BuildSafetyMeetingLoggersState extends State<BuildSafetyMeetingLoggers> {
  int n = 5;
  @override
  Widget build(BuildContext context) {
    //TODO: make 15 fields
    return Scaffold(
      appBar: AppBar(
        title: Text("Safety Meeting Loggers"),
      ),
      drawer: BuildDrawer(),
      body: Scrollbar(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.all(18.0),
              child: Material(
                elevation: 18,
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Text("Pick a date of Meeting", style: TextStyle(fontSize: 20)),
                    DatePicker(
                      DateTime.now(),
                      height: 90,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 8,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text(
                          "List Of Attendees",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(

                          height: 35,
                          width: 150,
                          // child: TextFormField(
                          //   keyboardType: TextInputType.numberWithOptions(
                          //       signed: false, decimal: false),
                          // ),
                          child: SpinBox(
                            value: 5,
                            max: 50,
                            min: 2,
                            onChanged: (value){
                              setState(() {
                                n=value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text("SR No."), numeric: true),
                              DataColumn(
                                label: Text("Name of Attendee"),
                              ),
                            ],
                            rows: [
                              for(var i = 1; i<=n; i++)
                                DataRow(cells: [
                                  DataCell(Text("$i."), ),
                                  DataCell(TextField(), placeholder: true),
                                ])
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // for (var i =1; i<=n; i++)
            CustomTextFormField(
              hint: "Agenda of the meeting",
              icon: Icons.topic,
            ),

            CustomParagraph(
              title: "Key notes of the meeting",
            ),
            CustomParagraph(
              title: "Next Steps",
            ),
            CustomParagraph(
              title: "Follow Up Plan",
            ),

          ],
        ),
      ),
    );
  }
}

class CustomParagraph extends StatelessWidget {
  final title;

  const CustomParagraph({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
      child: Material(
        elevation: 18,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Text(
              "$title",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  autofocus: true,
                  enableSuggestions: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
