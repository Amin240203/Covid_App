import 'dart:ffi';

import 'package:covid_app4/WebWHO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_app4/bottom_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'network.dart';

class CoronaVirusApp extends StatefulWidget {
  @override
  _CoronaVirusAppState createState() => _CoronaVirusAppState();

}

class _CoronaVirusAppState extends State<CoronaVirusApp> {

  Future data;
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
    data.then( (value) => {
      print (value[0]['name'])
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      Container(
        height: double.infinity,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                // background gambar
                  image: AssetImage('assets/Frame.png'),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Laporan Jumlah Kasus di Indonesia',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                createTextFromApi(),
                //createTextFromApi2(),
                createTextFromApi3(),
              ],
            ),
          ) ,
        ),
      ),
      WebView(initialUrl: "https://kawalcovid19.id/",
        javascriptMode: JavascriptMode.unrestricted,),
      Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Text('Pusat Informasi', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            Container( margin: EdgeInsets.only(top: 50),
              child: RaisedButton(
                child: Text('WHO'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute (builder: (context) => WebWHO()));
                },
              ),
            ),
            RaisedButton(
              child: Text('WHO'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute (builder: (context) => WebWHO()));
              },
            ),
            RaisedButton(
              child: Text('WHO'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute (builder: (context) => WebWHO()));
              },
            ),
          ],
        ),
      ),
    ];
    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.web),
        title: Text('Web'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
        title: Text('Information'),
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Lawan Covid19"),
      ),
      body: Container(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
  Future getData() async {
    Network network = Network("https://api.kawalcorona.com/indonesia/");
    return network.fetchData();
  }
  Widget createTextFromApi() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30.0, right: 30.0,),
          alignment: Alignment.center,
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white),
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "    Positif:\n ${snapshot.data[0]["positif"]}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                else {
                  return CircularProgressIndicator();
                }
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0, right: 00.0,),
          alignment: Alignment.center,
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white),
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "   Sembuh:\n ${snapshot.data[0]["sembuh"]}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ],
    );
  }
  Widget createTextFromApi3() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30.0, right: 30.0,),
          alignment: Alignment.topCenter,
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white),
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "    Meninggal:\n ${snapshot.data[0]["meninggal"]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                else {
                  return CircularProgressIndicator();
                }
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 00.0,),
          alignment: Alignment.center,
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white),
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "  dirawat:\n ${snapshot.data[0]["dirawat"]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ],
    );
  }
}

