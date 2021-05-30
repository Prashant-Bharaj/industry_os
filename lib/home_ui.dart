import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'build_home_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({ Key key, this.title}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          drawer: BuildDrawer(),
          appBar: AppBar(title: Text(widget.title),),
          body: BuildHomeScreen(),
        ),
      ),
    );
  }
}

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/industry.jpeg"), fit: BoxFit.cover),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  child: Text(
                    'Industry OS',
                    style: TextStyle(fontSize: 30,color: Colors.white,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,),
                  ),
                )),
          ),
          ListTile(
            title: Text(
              'MIS',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/HomeScreen");
              print("clicked on MIS");
            },
          ),
          Divider(
            height: 3,
          ),
          ListTile(
            title: Text(
              'Report',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            onTap: () {
              print("clicked on Report");
              Navigator.pushNamed(context, "/BuildReport");
            },
          ),
          Divider(
            height: 3,
          ),
          ListTile(
            title: Text(
              'Daily Logs',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              print("clicked on daily logs");
              Navigator.pushNamed(context, "/BuildDailyLogs");
            },
          ),
          Divider(
            height: 3,
          ),
          ListTile(
            title: Text(
              'Safety meeting loggers',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/BuildSafetyMeetingLoggers');
            },
          ),
          Divider(
            height: 3,
          ),
          ListTile(
            title: Text(
              'Internal Audit Reports',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context,"/BuildInternalAuditReports");
            },
          ),
          Divider(
            height: 3,
          ),
        ],
      ),
    );
  }
}
