import 'package:flutter/material.dart';

import 'body_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: AppBar(
        //    centerTitle: true,
        //    title: Text("Quiz" , style: TextStyle(fontWeight: FontWeight.w500),),
        //  ),
        // body: BodyScreen(),

        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  expandedHeight: 180.0,
                  floating: true,
                  // pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        "Let's play It,\nChoose category to start",
                        // MediaQuery.of(context).size.height.toString() ,

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          // fontSize: 25,
                          height: 1.3,
                        ),
                      ),
                      background: Container(
                        color: Colors.white,
                      )),
                ),
              ];
            },
            body: BodyScreen()));
  }
}
