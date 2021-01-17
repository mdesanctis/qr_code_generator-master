import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
final pagetitle = 'Scan Code';   // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text(pagetitle),
        backgroundColor: Colors.green,),
         floatingActionButton: ElevatedButton(
           onPressed: () {
             Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => SecondRoute()),
             );
           },child: Text("Create New Prescription "),),



         body: Center(

            child:  QrImage(
              backgroundColor: Colors.white,
              data: 'Sample', // replace with var that relates to data generated
              version: QrVersions.auto,
              size: 320,
              gapless: true),



         ),

    ),


         );

           }

  }
  class SecondRoute extends StatelessWidget {
    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      return Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Form(
              key: _formKey,
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Name of Patient:'),
                    ),
                    TextFormField(validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Date (Day/Month/Year):'),
                    ),
                    TextFormField(validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Type of Drug:'),
                    ),
                    TextFormField(validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Additional Comments:'),
                    ),
                    TextFormField(),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: Text('Submit'))
                  ]))));
    }
  }
// Helloooooooo
