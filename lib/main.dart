// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:flutter/material.dart';

// Code written in Dart starts exectuting from the main function. runApp is part of
// Flutter, and requires the component which will be our app's container. In Flutter,
// every component is known as a "widget".
void main() => runApp(new ConvertItApp());

// Every component in Flutter is a widget, even the whole app itself
class ConvertItApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Convert It',
      home: new TodoList(),
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.black
          ), 
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String baselineArchVal = "";
  String baselineCivVal = "";
  String baseline = "";
  bool isArchDecimal = true;
  String knownArchVal = "";
  String knownCivVal = "";


  Widget _buildBody() {
    return new Scaffold(
        body: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            ),
          child: SingleChildScrollView(
            child: GestureDetector (
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Container(
                child: Column (
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _buildBaselineContainer()
                    ),
                    Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: _buildKnownValueContainer())
                  ],),
                padding: new EdgeInsets.all(10.0),
                color: Colors.transparent,
              ),
            ),
          )
        ),
        backgroundColor: Colors.grey[300],
    );
  }

Widget _buildBaselineContainer() {
    return new Container (
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: new EdgeInsets.all(20.0),
        child: Column (
          children: [
            Row(
              children: [
                Text(
                  'Baseline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Switch(
                  value: isArchDecimal, 
                  onChanged: (value) => {
                  }
                  ),
                // add toggle for ft/in - decimal here
              ]),
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Row(
                children: [
                  Text(
                    'Architecural:',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (val) {
                       _setBaselineArchValue(val);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Row(
                children: [
                  Text(
                    'Civil:',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (val) {
                       _setBaselineCivValue(val);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true
                    ),
                  ),
                )
              ],
            ),
          ]),
        )
    );
  }

  Widget _getBaseArchInput(bool val) {
    if (val) {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              onChanged: (val) {
                  _setBaselineArchValue(val);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
              keyboardType: TextInputType.numberWithOptions(
                signed: false, decimal: true,
              ),
            ),
          )
        ],
      );
    } else {
      return new Row(

      );
    }
  }

  Widget _buildKnownValueContainer() {
    return new Container (
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: new EdgeInsets.all(20.0),
        child: Column (
          children: [
            Row(
              children: [
                Text(
                  'Known Values (enter one)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ]),
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Row(
                children: [
                  Text(
                    'Known Architecural Value:',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (val) {
                       _setKnownArchValue(val);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Row(
                children: [
                  Text(
                    'Known Civil Value:',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (val) {
                       _setKnownCivValue(val);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true
                    ),
                  ),
                )
              ],
            ),
          ]),
        )
    );
  }

  // set baselineArchValue
  void _setBaselineArchValue(String val) {
    // call setState to reset UI and update stored value
    setState(() => baselineArchVal = val);
  }

    // set baselineCivValue
  void _setBaselineCivValue(String val) {
    // call setState to reset UI and update stored value
    setState(() => baselineCivVal = val);
  }

    // set knownArchValue
  void _setKnownArchValue(String val) {
    // call setState to reset UI and update stored value
    setState(() => knownArchVal = val);
  }

    // set knownCivValue
  void _setKnownCivValue(String val) {
    // call setState to reset UI and update stored value
    setState(() => knownCivVal = val);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Convert It'),
        backgroundColor: Colors.white,
        
      ),
      body: _buildBody(),
      floatingActionButton: new FloatingActionButton.extended(
        backgroundColor: Colors.yellow[800],
        shape: BeveledRectangleBorder(),
        onPressed: () {
          // DEBUG
          //print("baseline arch: " + baselineArchVal),
          //print("baseline civ " + baselineCivVal),
          //print("known arch: " + knownArchVal),
          //print("known civ: " + knownCivVal)
          if (_checkIfReadyToConvert()) {
            _pushAddResultsScreen();
          } else {
            final snackBar = SnackBar(
              content: Text('Please enter a value in only one Known input.')
            );
           _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        }, 
        tooltip: 'Convert it',
        icon: Icon(Icons.calculate),
        label: Text("Convert-It"),
      ),
    );
  }

  void _pushAddResultsScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well
      // as adding a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Conversion Results')
            ),
            body: _buildResultsPage(),
          );
        }
      )
    );
  }

  Widget _buildResultsPage() {
    return new Container(
      child: Column(
        children: [
          Container (
            decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text("Baseline: "),
                Text(_getBaseline()),
              ],
            ),
          ),
          Text("Conversion Output: "),
          Text(_getConversionValue())
        ],
      ),
    );
  }

  String _getConversionValue() {
    if (knownArchVal == "") {
      // this means we are using civil to convert the architectural value
      double civil = double.parse(knownCivVal);
      String arch = (civil - double.parse(baseline)).toString();
      return "Architectural Converted Value: " + arch;
    } else if (knownCivVal == "") {
      // this means we are using arch to convert civil value
      double arch = double.parse(knownArchVal);
      String civil = (arch + double.parse(baseline)).toString();
      return "Civil Converted Value: " + civil;
    }
    return "Invalid inputs, please try again.";
  } 

  String _getBaseline() {
    double arch = double.parse(baselineArchVal);
    double civil = double.parse(baselineCivVal);
    baseline = (civil - arch).toString();
    return baseline;
  }

  bool _checkIfReadyToConvert() {
    if (knownArchVal == "" && knownCivVal == "") {
      return false;
    } else if (knownArchVal != "" && knownCivVal != "") {
      return false;
    } else {
      return true;
    }
  }
}