import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:industry_os/home_ui.dart';
import 'package:industry_os/widgets/custom_form_field.dart';

class BuildDailyLogs extends StatefulWidget {
  @override
  _BuildDailyLogsState createState() => _BuildDailyLogsState();
}

class _BuildDailyLogsState extends State<BuildDailyLogs> {
  int n = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Logs"),
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
                    Text("Pick a date"),
                    DatePicker(
                      DateTime(DateTime.now().day),
                      initialSelectedDate: DateTime.now(),
                      // activeDates: [DateTime(DateTime.january),DateTime(DateTime.december)],
                      height: 90,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 13,
                child: Column(
                  children: [
                    Text(
                      "Pick a number of notes",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SpinBox(
                        value: 5,
                        max: 15,
                        min: 1,
                        onChanged: (value){
                          setState(() {
                            n=value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),


            for (var i =1; i<=n; i++)CustomTextFormField(
              hint: "quick note $i",
              icon: Icons.note,
            ),
          ],
        ),
      ),
    );
  }
}


//Grid view of that
/*
class BuildDailyLogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('example 02'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => Container(
              color: Colors.green,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
      ),
    );
  }
}
*/
