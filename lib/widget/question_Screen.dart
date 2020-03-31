import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz/screens/scoredisplay.dart';
import 'package:quiz/widget/clock.dart';
import 'package:quiz/widget/selection_list.dart';


int counter = 0;
bool shownextpageButton = false;


class question extends StatefulWidget {
  var quiz;
  question(this.quiz);
  @override
  _questionState createState() => _questionState(this.quiz);
}

class _questionState extends State<question> {
  var tenSec = Duration(seconds: 10);
  
  
  @override
  void initState() {
    shownextpageButton = false;
    counter = 0;
    Timer.periodic(tenSec, (Timer t) {
      setState(() {
        if (counter < 09) {
          counter = counter + 1;
        } else {
          t.cancel();
        }
      });
    });
    super.initState();
  }

  var quiz;

  _questionState(this.quiz);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          centerTitle: true,
          title: Text((counter + 1).toString() + "/10"),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.vertical(
                  bottom: new Radius.elliptical(
                      MediaQuery.of(context).size.width, 100.0)),
              color: Colors.deepPurpleAccent),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.330840069,
          // color: Colors.deepPurpleAccent,
          child: Card(
            margin: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 0),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    (quiz['results'][counter]['question']),
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                )),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  child: Clock(),
                )
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
          ),
        ),

        Container(          
          child: Selectionlist(quiz['results'][counter]),
        ),

        Container(child: shownextpageButton==true? RaisedButton(onPressed: (){} ,child: Text("data"),):SizedBox(height: 0,) ,)
        // RaisedButton(onPressed: (){},child: , )
      ],
    );
  }
}













class Clock extends StatefulWidget {
  Clock();
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState(){
    startTimer();
  }

  Timer _timer;
    int _start=1;
    void startTimer() {
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {

            if(counter <=09){

              if (_start >9) {
                if(counter ==9){
                  Timer(Duration(seconds: 10), (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ScoreDisplayPage();
                    }));
                  });
                }

                _start = 1;
                startTimer();
                timer.cancel();
              } else {
                _start = _start + 1;
              }

              
            }
            
            else{
              if(shownextpageButton == false){
                // _start = 1;
                // shownextpageButton = true;
                
              }

              timer.cancel();
            }

          },
        ),
      );
    }
    

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomAppBar(
        elevation: 0,
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.amber,
          ),
          value: _start / 9,
        ),
      ),
    );
  }
}
