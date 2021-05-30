import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:industry_os/home_ui.dart';
import 'package:industry_os/widgets/custom_form_field.dart';

class BuildInternalAuditReports extends StatefulWidget {
  @override
  _BuildInternalAuditReportsState createState() => _BuildInternalAuditReportsState();
}

class _BuildInternalAuditReportsState extends State<BuildInternalAuditReports> {  int n = 5;
@override
Widget build(BuildContext context) {
  int noOfAuthors = 2;
  return Scaffold(
    appBar: AppBar(title: Text("Internal Audit Reports"),),
    drawer: BuildDrawer(),
    body: Scrollbar(
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
                    "Audit Details",
                    style: TextStyle(fontSize: 20),
                  ),
                  CustomTextFormField(
                    hint: "Title of Audit",
                    icon: Icons.title,
                  ),
                  CustomTextFormField(
                    hint: "Department/Speciality",
                    icon: Icons.account_balance,
                  ),
                  CustomTextFormField(
                    hint: "Audit lead",
                    icon: Icons.person,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Text(
                        "List of Authors",
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
                          value: 2,
                          max: 50,
                          min: 2,
                          onChanged: (value){
                            setState(() {
                              noOfAuthors=value.toInt();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text("SR No."), numeric: true),
                          DataColumn(
                            label: Text("Authors"),
                          ),
                        ],
                        rows: [
                          for(var i = 1; i<=noOfAuthors; i++)
                            DataRow(cells: [
                              DataCell(Text("$i."), ),
                              DataCell(TextField(), placeholder: true),
                            ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          BuildTextField(title: "Aim",),
          BuildTextField(title: "Standard",),
          BuildTextField(title: "Methodology",),
          BuildTextField(title: "Results",),
          BuildTextField(title: "Conclusions",),
          BuildTextField(title: "Recommendation",),

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
    ),
  );
  }
}

class BuildTextField extends StatelessWidget {
  final String title;
  const BuildTextField({
    Key key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 20),),
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
    );
  }
}
