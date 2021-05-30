import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

math.Random random = new math.Random();
final List<List<double>> charts = [
  [
    0.0,
    0.3,
    0.7,
    0.6,
    0.55,
    0.8,
    1.2,
    1.3,
    1.35,
    0.9,
    1.5,
    1.7,
    1.8,
    1.7,
    1.2,
    0.8,
    1.9,
    2.0,
    2.2,
    1.9,
    2.2,
    2.1,
    2.0,
    2.3,
    2.4,
    2.45,
    2.6,
    3.6,
    2.6,
    2.7,
    2.9,
    2.8,
    3.4
  ],
  [
    0.0,
    0.3,
    0.7,
    0.6,
    0.55,
    0.8,
    1.2,
    1.3,
    1.35,
    0.9,
    1.5,
    1.7,
    1.8,
    1.7,
    1.2,
    0.8,
    1.9,
    2.0,
    2.2,
    1.9,
    2.2,
    2.1,
    2.0,
    2.3,
    2.4,
    2.45,
    2.6,
    3.6,
    2.6,
    2.7,
    2.9,
    2.8,
    3.4,
    0.0,
    0.3,
    0.7,
    0.6,
    0.55,
    0.8,
    1.2,
    1.3,
    1.35,
    0.9,
    1.5,
    1.7,
    1.8,
    1.7,
    1.2,
    0.8,
    1.9,
    2.0,
    2.2,
    1.9,
    2.2,
    2.1,
    2.0,
    2.3,
    2.4,
    2.45,
    2.6,
    3.6,
    2.6,
    2.7,
    2.9,
    2.8,
    3.4,
  ],
  [
    0.0,
    0.3,
    0.7,
    0.6,
    0.55,
    0.8,
    1.2,
    1.3,
    1.35,
    0.9,
    1.5,
    1.7,
    1.8,
    1.7,
    1.2,
    0.8,
    1.9,
    2.0,
    2.2,
    1.9,
    2.2,
    2.1,
    2.0,
    2.3,
    2.4,
    2.45,
    2.6,
    3.6,
    2.6,
    2.7,
    2.9,
    2.8,
    3.4,
    0.0,
    0.3,
    0.7,
    0.6,
    0.55,
    0.8,
    1.2,
    1.3,
    1.35,
    0.9,
    1.5,
    1.7,
    1.8,
    1.7,
    1.2,
    0.8,
    1.9,
    2.0,
    2.2,
    1.9,
    2.2,
    2.1,
    2.0,
    2.3,
    2.4,
    2.45,
    2.6,
    3.6,
    2.6,
    2.7,
    2.9,
    2.8,
    3.4,
    0.0,
    0.3,
    0.7,
    0.6,
    0.55,
    0.8,
    1.2,
    1.3,
    1.35,
    0.9,
    1.5,
    1.7,
    1.8,
    1.7,
    1.2,
    0.8,
    1.9,
    2.0,
    2.2,
    1.9,
    2.2,
    2.1,
    2.0,
    2.3,
    2.4,
    2.45,
    2.6,
    3.6,
    2.6,
    2.7,
    2.9,
    2.8,
    3.4
  ]
];

var extra = {
  {
    "id": 4,
    "email": "braxton29@hotmail.com",
    "first": "Perry",
    "last": "Leffler",
    "company": "Sipes, Feeney and Hansen",
    "created_at": "2014-07-10T11:31:40.235Z",
    "country": "Chad"
  },
  {
    "id": 5,
    "email": "turner59@gmail.com",
    "first": "Janelle",
    "last": "Hagenes",
    "company": "Lesch and Daughters",
    "created_at": "2014-04-21T15:05:43.229Z",
    "country": "Swaziland"
  },
  {
    "id": 6,
    "email": "halie47@yahoo.com",
    "first": "Charity",
    "last": "Bradtke",
    "company": "Gorczany-Monahan",
    "created_at": "2014-09-21T21:59:18.892Z",
    "country": "Lebanon"
  },
  {
    "id": 7,
    "email": "loren_yundt@gmail.com",
    "first": "Dejah",
    "last": "Kshlerin",
    "company": "Williamson-Hickle",
    "created_at": "2014-11-11T12:20:53.154Z",
    "country": "Egypt"
  },
  {
    "id": 8,
    "email": "kenton_macejkovic80@hotmail.com",
    "first": "Ellen",
    "last": "Schaefer",
    "company": "Tillman-Harris",
    "created_at": "2014-07-23T02:00:28.649Z",
    "country": "Israel"
  },
  {
    "id": 9,
    "email": "pascale5@yahoo.com",
    "first": "Sven",
    "last": "Funk",
    "company": "Dare Group",
    "created_at": "2014-04-11T12:43:28.977Z",
    "country": "Macao"
  },
  {
    "id": 10,
    "email": "frank34@yahoo.com",
    "first": "Ryleigh",
    "last": "Cole",
    "company": "Zieme and Daughters",
    "created_at": "2014-10-18T05:50:28.626Z",
    "country": "Congo"
  },
  {
    "id": 11,
    "email": "harry65@hotmail.com",
    "first": "Cooper",
    "last": "Grimes",
    "company": "Brakus-Rath",
    "created_at": "2014-04-29T06:41:20.214Z",
    "country": "Reunion"
  },
  {
    "id": 12,
    "email": "kiana.schowalter@gmail.com",
    "first": "Esteban",
    "last": "Homenick",
    "company": "Bode-Botsford",
    "created_at": "2014-12-29T18:46:35.269Z",
    "country": "Guadeloupe"
  },
  {
    "id": 13,
    "email": "josh_batz60@gmail.com",
    "first": "Lucinda",
    "last": "Waters",
    "company": "Ratke LLC",
    "created_at": "2015-03-13T12:15:50.844Z",
    "country": "Lebanon"
  },
  {
    "id": 14,
    "email": "zula36@hotmail.com",
    "first": "Jarvis",
    "last": "Grimes",
    "company": "Durgan, Sporer and Bogan",
    "created_at": "2014-04-23T23:56:11.268Z",
    "country": "Ghana"
  },
  {
    "id": 15,
    "email": "romaine21@gmail.com",
    "first": "Jordon",
    "last": "Turcotte",
    "company": "Green-Haag",
    "created_at": "2014-07-13T00:07:36.299Z",
    "country": "Serbia"
  },
  {
    "id": 16,
    "email": "abdul3@hotmail.com",
    "first": "Marques",
    "last": "Bins",
    "company": "Hoeger, Frami and Kihn",
    "created_at": "2014-04-10T14:07:26.141Z",
    "country": "Sudan"
  },
  {
    "id": 17,
    "email": "van39@hotmail.com",
    "first": "Edgar",
    "last": "Jaskolski",
    "company": "Waelchi-Schuppe",
    "created_at": "2014-11-18T22:42:23.788Z",
    "country": "Wallis and Futuna"
  },
  {
    "id": 18,
    "email": "emie_corkery82@yahoo.com",
    "first": "Adell",
    "last": "Rodriguez",
    "company": "Tillman, Bailey and Weimann",
    "created_at": "2014-07-19T07:19:38.388Z",
    "country": "Sierra Leone"
  },
  {
    "id": 19,
    "email": "alexis62@hotmail.com",
    "first": "Madonna",
    "last": "Luettgen",
    "company": "Heathcote-Schiller",
    "created_at": "2014-08-25T04:29:45.139Z",
    "country": "Namibia"
  },
  {
    "id": 20,
    "email": "lucius_hills53@yahoo.com",
    "first": "Andre",
    "last": "Huel",
    "company": "Stroman Inc",
    "created_at": "2014-08-22T22:56:27.222Z",
    "country": "Georgia"
  },
  {
    "id": 21,
    "email": "jeanette.leannon29@hotmail.com",
    "first": "Darrin",
    "last": "Larson",
    "company": "Ernser-Oberbrunner",
    "created_at": "2014-09-01T21:22:39.559Z",
    "country": "Lebanon"
  },
  {
    "id": 22,
    "email": "concepcion_kiehn@hotmail.com",
    "first": "Johann",
    "last": "Hintz",
    "company": "Paucek and Sons",
    "created_at": "2014-12-29T18:29:33.150Z",
    "country": "Congo"
  },
  {
    "id": 23,
    "email": "blaze84@yahoo.com",
    "first": "Cruz",
    "last": "Harber",
    "company": "O'Connell and Sons",
    "created_at": "2014-10-23T09:57:26.941Z",
    "country": "Lesotho"
  },
};

void hello() {
  for (var i in extra) {
    print(i.keys);
  }
  // print(l1);
}

List<double> generateRandomData(int count) {
  List<double> result = <double>[];
  for (int i = 0; i < count; i++) {
    result.add(random.nextDouble() * 100);
  }
  return result;
}

List<double> generateRandomCumulative(int count) {
  List<double> result = <double>[];
  for (int i = 0; i < count; i++) {
    if(result.isEmpty) continue;
    result.add(random.nextDouble() * 100 + result[i+1]);
  }
  return result;
}

final List<String> chartDropdownItems = [
  'Last 7 days',
  'Last month',
  'Last year'
];
String currentDropDownRevenue = chartDropdownItems[0];
String currentDropDownInteraction = chartDropdownItems[0];
int chartIndex = 0;
int chartIndexInteraction = 0;

class BuildHomeScreen extends StatefulWidget {
  @override
  _BuildHomeScreenState createState() => _BuildHomeScreenState();
}

class _BuildHomeScreenState extends State<BuildHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var data = generateRandomData(100);
    return Scaffold(
        body: StaggeredGridView.count(
      crossAxisCount: 1,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        _buildTile(
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('user interaction',
                              style: TextStyle(color: Colors.green)),
                        ],
                      ),
                      DropdownButton(
                          isDense: true,
                          value: currentDropDownInteraction,
                          onChanged: (String value) => setState(() {
                                currentDropDownInteraction = value;
                                chartIndexInteraction = chartDropdownItems
                                    .indexOf(value); // Refresh the chart
                              }),
                          items: chartDropdownItems.map((String title) {
                            return DropdownMenuItem(
                              value: title,
                              child: Text(title,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0)),
                            );
                          }).toList())
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4.0)),
                  Sparkline(
                    data: data,
                    lineColor: Colors.lightGreen[500],
                    fillMode: FillMode.below,
                    fillColor: Colors.lightGreen[200],
                    pointsMode: PointsMode.all,
                    pointSize: 5.0,
                    pointColor: Colors.amber,
                  )
                ],
              )),
          onTap: () => hello(),
        ),
        _buildTile(
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Revenue',
                              style: TextStyle(color: Colors.green)),
                          Text('\$16K',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0)),
                        ],
                      ),
                      DropdownButton(
                          isDense: true,
                          value: currentDropDownRevenue,
                          onChanged: (String value) => setState(() {
                                currentDropDownRevenue = value;
                                chartIndex = chartDropdownItems
                                    .indexOf(value); // Refresh the chart
                              }),
                          items: chartDropdownItems.map((String title) {
                            return DropdownMenuItem(
                              value: title,
                              child: Text(title,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0)),
                            );
                          }).toList())
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4.0)),
                  Sparkline(
                    data: charts[chartIndex],
                    lineWidth: 5.0,
                    lineColor: Colors.greenAccent,
                  )
                ],
              )),
        ),
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Product, Sales and Review",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              border: TableBorder.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2,
              ),
              children: [
                buildTableRow(
                    col1: 'Product',
                    col2: 'Sales',
                    col3: 'Review',
                    fontSize: 20),
                buildTableRow(col1: 'My OS', col2: '350', col3: '5*'),
                buildTableRow(col1: 'pencil', col2: '4000', col3: '4*'),
                buildTableRow(col1: 'headphones', col2: '10340', col3: '4*'),
                for (var i = 0; i < 10; i++)
                  buildTableRow(
                      col1: 'Product${i + 1}',
                      col2: '${math.Random().nextInt(10000)}',
                      col3: '${math.Random().nextInt(4) + 1}*'),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                // borderRadius: BorderRadius,
                elevation: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Employees information",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          for (var i in [
                            'id',
                            'email',
                            'first',
                            'last',
                            'company',
                            'created_at',
                            'country'
                          ])
                            DataColumn(label: Text("$i")),
                        ],
                        rows: extra
                            .map((e) => DataRow(cells: [
                                  DataCell(
                                      Text(e.values.elementAt(0).toString())),
                                  DataCell(
                                      Text(e.values.elementAt(1).toString())),
                                  DataCell(
                                      Text(e.values.elementAt(2).toString())),
                                  DataCell(
                                      Text(e.values.elementAt(3).toString())),
                                  DataCell(
                                      Text(e.values.elementAt(4).toString())),
                                  DataCell(
                                      Text(e.values.elementAt(5).toString())),
                                  DataCell(
                                      Text(e.values.elementAt(6).toString())),
                                ]))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
      staggeredTiles: [
        StaggeredTile.extent(1, 240.0),
        StaggeredTile.extent(1, 240.0),
        StaggeredTile.extent(1, 1500),
        // StaggeredTile.extent(1, 10000),
      ],
    ));
  }

  TableRow buildTableRow(
      {@required String col1,
      @required String col2,
      @required String col3,
      double fontSize = 14}) {
    return TableRow(children: [
      Column(
        children: [
          Text(
            "$col1",
            style: TextStyle(fontSize: fontSize),
          )
        ],
      ),
      Column(
        children: [
          Text(
            "$col2",
            style: TextStyle(fontSize: fontSize),
          )
        ],
      ),
      Column(
        children: [
          Text(
            "$col3",
            style: TextStyle(fontSize: fontSize),
          )
        ],
      ),
    ]);
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
