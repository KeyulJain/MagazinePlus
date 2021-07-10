import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }
  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 40, 20),
      child: Row(
        children: [
          Expanded(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [

                Container(
                  padding: const EdgeInsets.fromLTRB(0,0, 10, 0),
                  child: Text(
                    'Magazine+',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.search_rounded,
            color: Colors.black,
          ),
        ],
      ),
    );


    Widget editions = Container(
      padding: const EdgeInsets.fromLTRB(40, 15, 30, 10),
      child: Row(
        children: [
          Expanded(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [

                Container(
                  padding: const EdgeInsets.fromLTRB(0,0, 10, 0),
                  child: Text(
                    'New Editions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                  child: InkWell(
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.amber[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // Safe Locket Container

    Widget Resources = Container(
      padding: const EdgeInsets.fromLTRB(40, 10, 30, 5),
      child: Row(
        children: [
          Expanded(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [

                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                  child: Text(
                    'Blogs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                  child: InkWell(
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.amber[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget BlogResources = Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
      child: Center(
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  blogCard(200.0, Colors.red[400], Colors.red[50], 'Support', 'Contact Us', 'M', Colors.white),
                  blogCard(170.0, Colors.red[400], Colors.red[50], 'Support', 'Contact Us', 'M', Colors.white),
                  blogCard(200.0, Colors.red[400], Colors.red[50], 'Support', 'Contact Us', 'M', Colors.white),
                  blogCard(170.0, Colors.red[400], Colors.red[50], 'Support', 'Contact Us', 'M', Colors.white),
                ],
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  blogCard(170.0, Colors.red[400], Colors.red[50], 'Support', 'Contact Us', 'M', Colors.white),
                  blogCard(200.0, Colors.red[400], Colors.red[50], 'Support', 'Contact Us', 'M', Colors.white),
                  blogCard(170.0, Colors.red[400], Colors.red[50], 'Support', 'Contact Us', 'M', Colors.white),
                  blogCard(200.0, Colors.red[400], Colors.red[50], 'Support', 'Contact Us', 'M', Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // Scroll Bar Widget

    return MaterialApp(
      title: 'Safe Locket',
      home: Scaffold(
        body: ListView(
          children: [
            titleSection,
            editions,
            testpdf(),
            Resources,
            BlogResources,
          ],
        ),
      ),
    );
  }
}

class blogCard extends StatelessWidget {
  final height;
  final inColor;
  final outColor;
  final title;
  final subtitle;
  final logo;
  final logoColor;

  blogCard(this.height, this.inColor, this.outColor, this.title, this.subtitle, this.logo, this.logoColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: 150.0,
      color: Colors.transparent,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: this.outColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 30, height: 20,),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  color: this.inColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Center(
                child: Text(
                  this.logo,
                  style: TextStyle(
                    color: this.logoColor,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                SizedBox(height: 20),
                Text(this.title,
                  style: TextStyle(color: Colors.black,
                      fontSize: 17),
                  textAlign: TextAlign.center,),
                SizedBox(height: 5,),
                Text(
                  this.subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.only(left: 15),
      ),
      padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final doc;
  SecondRoute(this.doc);
  //SecondRoute();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PDFViewer(document: this.doc)
      ),
    );
  }
}

class testpdf extends StatelessWidget {

  Future<String> getUrl(name) async {
    var ref = firebase_storage.FirebaseStorage.instance.ref().child('Pdf').child('Thumbnails').child(name);
    var url = await ref.getDownloadURL();
    return url;
  }

  Future<String> getPath(name) async {
    var path = firebase_storage.FirebaseStorage.instance.ref().child('Pdf').child('pdfs').child(name);
    var url = await path.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 220.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: 50.0,
                width: 140.0,
                color: Colors.transparent,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FutureBuilder<String>(
                        future: getUrl('nasa.png'),
                        builder: (context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            return Image.network(snapshot.data!, fit: BoxFit.fill);
                          } else {
                            return CircularProgressIndicator();
                          }
                        }
                    )
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              onTap: () async{
                var url = await getPath('Experiment 1.pdf');
                PDFDocument doc = await PDFDocument.fromURL(url);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute(doc)),
                );
              },
            ),
            GestureDetector(
              child: Container(
                height: 50.0,
                width: 140.0,
                color: Colors.transparent,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FutureBuilder<String>(
                          future: getUrl('nasa.png'),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return Image.network(snapshot.data!, fit: BoxFit.fill);
                            } else {
                              return CircularProgressIndicator();
                            }
                          }
                      )
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              onTap: () async{
                var url = await getPath('Experiment 1.pdf');
                PDFDocument doc = await PDFDocument.fromURL(url);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute(doc)),
                );
              },
            ),
            GestureDetector(
              child: Container(
                height: 50.0,
                width: 140.0,
                color: Colors.transparent,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FutureBuilder<String>(
                          future: getUrl('nasa.png'),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return Image.network(snapshot.data!, fit: BoxFit.fill);
                            } else {
                              return CircularProgressIndicator();
                            }
                          }
                      )
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              onTap: () async{
                var url = await getPath('Experiment 1.pdf');
                PDFDocument doc = await PDFDocument.fromURL(url);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute(doc)),
                );
              },
            ),
            GestureDetector(
              child: Container(
                height: 50.0,
                width: 140.0,
                color: Colors.transparent,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FutureBuilder<String>(
                          future: getUrl('nasa.png'),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return Image.network(snapshot.data!, fit: BoxFit.fill);
                            } else {
                              return CircularProgressIndicator();
                            }
                          }
                      )
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              onTap: () async{
                var url = await getPath('Experiment 1.pdf');
                PDFDocument doc = await PDFDocument.fromURL(url);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute(doc)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}