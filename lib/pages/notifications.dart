import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF210D41),
        title: Text(
          "Notifications",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: MultiSwitch(),
    );
  }
}

class MultiSwitch extends StatefulWidget {
  const MultiSwitch({Key? key}) : super(key: key);

  @override
  _MultiSwitchState createState() => _MultiSwitchState();
}

class _MultiSwitchState extends State<MultiSwitch> {
  bool val1 = true;
  bool val2 = true;

  onChangeFunction1(bool newValue1){
    setState(() {
      val1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2){
    setState(() {
      val2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSwitch('Show Notification', val1, onChangeFunction1),
          customSwitch('Messages', val2, onChangeFunction2)
        ],
      ),
    )
    );
  }

  Widget customSwitch(String text, bool val, Function onChangeMethod){
    return Padding(padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF210D41),
          )),
          Spacer(),
          CupertinoSwitch(
              trackColor: Colors.grey,
              activeColor: Colors.blue,
              value: val,
              onChanged: (newValue){
                onChangeMethod(newValue);
              })
        ],
      ),
    );
  }
}