import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'network.dart';

class CoronaVirusApp extends StatefulWidget {
  @override
  _CoronaVirusAppState createState() => _CoronaVirusAppState();
}

class _CoronaVirusAppState extends State<CoronaVirusApp> {

  Future data;

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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Lawan Covid19"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  // background gambar
                    image: AssetImage('assets/Frame.png'),
                    fit: BoxFit.fill)),
          ),
          Padding(
           padding: EdgeInsets.all(20.0),
            child: Column(
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
          )
          ),
      ],
      ),
    );
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
    Future getData() async {
      Network network = Network("https://api.kawalcorona.com/indonesia/");
      return network.fetchData();
    }
}