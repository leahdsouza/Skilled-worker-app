import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RegisterWorker extends StatefulWidget {
  RegisterWorker({Key? key}) : super(key: key);



  @override
  _RegisterWorkerState createState() => _RegisterWorkerState();
}

class _RegisterWorkerState extends State<RegisterWorker> {
  String _selectedService = "Service Type";
  static const List<String> _services = ['Service Type','Plumber','Carpenter','AC Mechanic','Pest Services','Washing Machine Mechanic'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF210D41),
        title: Text("Register as Worker", style: TextStyle(fontSize: 22 , color: Colors.white, fontWeight: FontWeight.bold)),
    ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18,25,18,0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(int.parse(("0xffececec"))),
                      borderRadius: BorderRadius.circular(5),
                      // boxShadow: <BoxShadow>[
                      //   BoxShadow(
                      //       color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                      //       blurRadius: 5) //blur radius of shadow
                      // ]
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(

                          width: 0,
                          style: BorderStyle.none
                        )
                      ),

                    ),
                    hint: Text('Service Type'),
                    value: _selectedService,
                    onChanged: (newValue){
                      setState(() {
                        _selectedService = newValue.toString();
                      });
                    },
                    items: _services.map((service){
                      return DropdownMenuItem(
                        child: Text(service),
                        value: service,

                      );
                  }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0,0,18,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Charges',
                      style: TextStyle(
                        fontSize: 22
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                      width: 120,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                          ),
                          hintText: '₹ ',
                          fillColor: Color(int.parse(("0xffececec"))),
                          filled: true,


                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                  padding: const EdgeInsets.fromLTRB(18.0,0,18,12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload Scanned Documents',
                          style: TextStyle(
                            fontSize:20
                          ),
                        ),
                        Text(
                          '(Proof of Address)'
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                            Icons.upload_file,
                          color: Color(0xFF210D41),
                          size: 40,
                        )
                    )

                  ],
                ),
              ),
              SizedBox(height: 380,),
              TextButton(

                style: ElevatedButton.styleFrom(
                    primary: Color(int.parse("0xff210d41")),
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20)
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],

          ),

    ));
  }
}
