import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:quiz/screens/startpage.dart';
import './startpage.dart';

class BodyScreen extends StatefulWidget {
  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  List category_list = ['GK', 'Book', 'Film', 'Sports', 'Politics', 'Computer'];
  List category_id = ['9', '10', '11', '21', '24', '18'];
  List image_List = [
    'assets/images/gk.jpg',
    'assets/images/Book.jpg',
    'assets/images/film.jpg',
    'assets/images/sports.jpg',
    'assets/images/politics.jpg',
    'assets/images/computer.jpg'
  ];

  // List colors = [Color(0xffbeebe9), Color(0xffffe2ff), Color(0xffffe3ed) , Color(0xff8ac6d1) , Color(0xffc06c84)];
  List colors = [
    Colors.blue[200],
    Colors.pink[200],
    Colors.purple[200],
    Colors.orange[200],
    Colors.red[200],
    Colors.green[200]
  ];
  static Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: category_list.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StartPage(
                                  category_list[index], category_id[index])));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: ExactAssetImage(image_List[index]),
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.1),
                                  BlendMode.dstATop),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: colors[random.nextInt(colors.length)],
                          ),
                          // height: 150,

                          height: //843.42857
                              0.177847336 * MediaQuery.of(context).size.height,

                          child: Text(
                            category_list[index],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 35),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
