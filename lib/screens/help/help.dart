import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/screens/settings/settings.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';
import 'package:expandable/expandable.dart';


class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  String loremIpsum = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ";
  List<String> questions = [
    "How to register as Skilled Worker?",
    "How to book a Skilled Worker?",
    "How to rate a Skilled Worker?",
    "How to find Skilled Workers?",
    "How to register as Skilled Worker?"
  ] ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF210D41),
        title: Text("Help", style: TextStyle(fontSize: 22 , color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,10,10,10),
          child: Column(
            children:[
              for (var question in questions ) dropdowncard(question)
            ]
          )
        ),

      ),
      // bottomNavigationBar: BottomNavigation()
    );
  }




  Widget dropdowncard(String heading,){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Color(0xffececec),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,10,10,0),
          child: ExpandablePanel(
            header: Text(
              heading,
              style: TextStyle(
                fontSize: 16,

              ),
            ),
            collapsed: Text("", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
            expanded: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(loremIpsum, softWrap: true, ),
            ),

          ),
        ),
      ),
    );
  }
}


