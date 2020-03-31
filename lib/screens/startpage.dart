import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/widget/question_Screen.dart';

class StartPage extends StatefulWidget {
  String selectedcategory;
  String categoryid;
  StartPage(this.selectedcategory, this.categoryid);
  @override
  _StartPageState createState() =>
      _StartPageState(this.selectedcategory, this.categoryid);
}

class _StartPageState extends State<StartPage> {
  final String categoryid;

  final String selectedcategory;
  var quiz;
  http.Response quizhttp;

  Future<http.Response> getQuiz() async {
    quizhttp = await http.get(
        'https://opentdb.com/api.php?amount=10&category=' +
            categoryid +
            '&difficulty=easy&type=multiple');

    String quizhttpreplaced = quizhttp.body.replaceAll('&#039;', "'");
    String replaced = quizhttpreplaced.replaceAll('&quot;', '``');
    this.quiz = jsonDecode(replaced);
    // this.quiz = jsonDecode(utf8.decode(quizhttp.bodyBytes));
    // print(this.quiz);
    return quizhttp;
  }

  @override
  void initState() {
    Future<http.Response> quiz = getQuiz();

    quiz.then((onValue) {
      // print(onValue.body);
      this.quiz = onValue.body;
      // this.quiz = jsonDecode(this.quiz);
      super.initState();
    });
    // print(this.quiz);
    // this.quiz = jsonDecode(this.quiz);
  }

  _StartPageState(this.selectedcategory, this.categoryid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: FutureBuilder(
          future: getQuiz(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return question(quiz);
              // Text(quiz['results'][counter]['question'].toString());
            } else {
              return Center(child: CircularProgressIndicator(strokeWidth: 0.5, backgroundColor: Theme.of(context).primaryColor,));
            }
          }),
    ));
  }
}
