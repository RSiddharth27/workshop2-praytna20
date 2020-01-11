import 'package:praytna2/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:praytna2/detail_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(title: 'Workshops'),
      // home: DetailPage(),
    );
  }
}


class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.smoking_rooms, color: Colors.white),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //semanticsLabel: lesson.date,
        //style:TextStyle(color: Colors.white , fontWeight: :FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      //: Text()

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: lesson.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(lesson.level,
                    style: TextStyle(color: Colors.white)))

          )

        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Campus to Corporate",
        level: "InMobi",
        indicatorValue: 0.33,
        price: 0,
        content:
        "We shape your career goals, help you meet the expectations of the industry through this workshop and fulfil your dream of being recruited in top companies."),
    Lesson(
        title: "Digging into DATA",
        level: "Visa",
        indicatorValue: 1,
        price: 750,
        date : "Febraury 7 2k20",
        time : "9 AM",
        venue : "Lab",
        content:
        "#MasterTheFuture. Demands for Data Science increases rapidly. So there is a great opportunity for every software professional to enter this newly growing field and start a career in Data science."),
    Lesson(
        title: "Artificial Intelligence",
        level: "Amazon",
        indicatorValue: 0.5,
        price: 750,
        content:
        "AI is a tool. The choice about how it gets deployed is yours. Come together lets make a change. This AI workshop is a great experience where you could learn new things and do great wonders."),
    Lesson(
        title: "Web Development",
        level: "PayPal",
        indicatorValue: 0.66,
        price: 750,
        content:
        "An individual that understands how to design a website will generally be more creative when asked to solve a problem."),
    Lesson(
        title: "Ethical Hacking",
        level: "PAID",
        indicatorValue: 1.0,
        price: 750,
        content:
        "Are you dreaming to become a WHITE HAT HACKER in real life?. Do you want to learn hacking but don't know where to start? Then this is the workshop you have to be in."),
    Lesson(
        title: "App Development",
        level: "GeekyAnts",
        indicatorValue: 1.0,
        price: 750,
        content:
        "Inspired by Instagram, YouTube and Whatsapp? Learn more about app development to develop a scalable and attractive app for others."),
    Lesson(
        title: "Deep Learning",
        level: "GUVI",
        indicatorValue: 1.0,
        price: 750,
        content:
        "If you want to break into AI, Deep Learning will help you do so. Deep Learning is one of the most highly sought after skills in tech today."),
    Lesson(
      title: "Amazon Web Service",
      level : "Amazon Developers",
      indicatorValue: 1.0,
      price : 750,
      content:
        "Learn to deploy real applications in a scalable way, using Amazon Web Services (AWS)."
    )
  ];
}
