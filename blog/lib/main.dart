import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                  blogCard(200.0),
                  blogCard(170.0),
                  blogCard(200.0),
                ],
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  blogCard(170.0),
                  blogCard(200.0),
                  blogCard(170.0),
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
  blogCard(this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: 150.0,
      color: Colors.transparent,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 30, height: 20,),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  color: Colors.blue[500],
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Icon(
                Icons.send_sharp,
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                SizedBox(height: 20),
                Text("Support",
                  style: TextStyle(color: Colors.black,
                      fontSize: 17),
                  textAlign: TextAlign.center,),
                SizedBox(height: 5,),
                Text(
                  'Contact Us',
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
  //final doc;
  //SecondRoute(this.doc);
  SecondRoute();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magazine+'),
      ),
      body: Center(
        //child: PDFViewer(document: this.doc)
        child: UserInformation(),
      ),
    );
  }
}

class testpdf extends StatelessWidget {
  const testpdf({Key? key}) : super(key: key);
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
                  // child: new Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  // )
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network('https://www.nasa.gov/sites/default/files/styles/stem_hero/public/thumbnails/image/nasa-logo-web-rgb.jpg', fit: BoxFit.fill),
                    //fit: BoxFit.fitHeight)
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              onTap: () async{
                //PDFDocument doc = await PDFDocument.fromURL('https://www.unf.edu/~wkloster/2220/ppts/cprogramming_tutorial.pdf');
                Navigator.push(
                  context,
                  //MaterialPageRoute(builder: (context) => SecondRoute(doc)),
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
            Container(
              height: 50.0,
              width: 140.0,
              color: Colors.transparent,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                // child: new Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //
                // )
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network('https://www.nasa.gov/sites/default/files/styles/stem_hero/public/thumbnails/image/nasa-logo-web-rgb.jpg', fit: BoxFit.fill),
                  //fit: BoxFit.fitHeight)
                ),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              height: 50.0,
              width: 140.0,
              color: Colors.transparent,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                // child: new Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //
                // )
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network('https://www.nasa.gov/sites/default/files/styles/stem_hero/public/thumbnails/image/nasa-logo-web-rgb.jpg', fit: BoxFit.fill),
                  //fit: BoxFit.fitHeight)
                ),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              height: 50.0,
              width: 140.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network('https://www.nasa.gov/sites/default/files/styles/stem_hero/public/thumbnails/image/nasa-logo-web-rgb.jpg', fit: BoxFit.fill),
                  //fit: BoxFit.fitHeight)
                ),
              ),
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('admin').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: (snapshot.data! as QuerySnapshot).docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return new ListTile(
              title: new Text(data['img_path']),
              subtitle: new Text(data['pdf_path']),
            );
          }).toList(),
        );
      },
    );
  }
}