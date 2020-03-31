import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz/main.dart';
import 'package:quiz/widget/list_option.dart';

bool selected;
int correctCounter = 0;

class Selectionlist extends StatefulWidget {
  var quizitem;
  Selectionlist(this.quizitem);
  @override
  _SelectionlistState createState() => _SelectionlistState();
}

class _SelectionlistState extends State<Selectionlist> {
  _SelectionlistState() {
    correctCounter = 0;
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    List item = widget.quizitem['incorrect_answers'];

    String correctans = widget.quizitem['correct_answer'];

    item.insert(random.nextInt(3), correctans);
    item.shuffle();
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 50),
          itemCount: item.length,
          itemBuilder: (_, index) {
            selected = false;
            return itemofoptionlist(item[index], correctans);
          }),
    );
  }
}

class itemofoptionlist extends StatefulWidget {
  var element;
  String correctAns;
  itemofoptionlist(this.element, this.correctAns);
  @override
  _itemofoptionlistState createState() => _itemofoptionlistState();
}

class _itemofoptionlistState extends State<itemofoptionlist> {
  static var isSelected;

  @override
  Widget build(BuildContext context) {
    var element = widget.element;

    String correctAns = widget.correctAns;

    return Container(
      margin: EdgeInsets.only(top: 10),
      color: isSelected == element
          ? correctAns == element ? Colors.greenAccent : Colors.redAccent
          : Colors.white,
      child: Card(
        elevation: 0,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        // margin: EdgeInsets.symmetric(horizontal: 25),),
        child: ListTile(
          onTap: () {
            setState(() {
              if (selected != true) {
                selected = true;
                isSelected = element;
                if (element == correctAns) {
                  // print("answer is correct");
                  correctCounter = correctCounter + 1;
                } else {
                  // print("wrong selection");
                }
              }
            });
          },
          title: Center(child: Text(element)),
        ),
      ),
    );
  }
}

class ScoreDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _onBackPressed(context);
      },
      child: Scaffold(
        // body: Center(child: Text(correctCounter.toString())),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Your Score is",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 45),
              ),
              Text(
                correctCounter > 8 ? "Awesome" : "Good",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 45),
              ),
              Text(
                correctCounter.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // backgroundColor: Colors.red,
                    color: Colors.redAccent,
                    fontSize: 60),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Go to Home Screen'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MyApp()),
                  ModalRoute.withName('/'),
                ),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
