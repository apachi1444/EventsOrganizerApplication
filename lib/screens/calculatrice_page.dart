import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  Widget rowChild(String text) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: ClipRRect(
            borderRadius : BorderRadius.circular(borderRadius),
            child : Container(
                color : Colors.deepPurple[50],
                child : Center(
                  child : Text(
                      text,
                      style:TextStyle(
                          color : Colors.deepPurple,
                          fontSize: fontSize
                      )
                  ),
                )
            )
        ),
      ),
    );
  }

  Widget columnChild(int numberRows , int start){
    for ( var i = 0; i < numberRows; i++){
      String text = start.toString();
      start++;
      return rowChild(text);
    }
    return Container();
  }

  double fontSize =20;
  double padding = 5;
  double borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],

      body : Column(
        children : <Widget>[
          Expanded(
            child : Container(

            )
          ),

          Expanded(
            child : Container(
              child : Column(
                children :<Widget>[
                  Expanded(
                    child :Row(
                    children : <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(padding),
                            child: ClipRRect(
                              borderRadius : BorderRadius.circular(borderRadius),
                              child : Container(
                                color : Colors.deepPurple[50],
                                child : Center(
                                  child : Text(
                                  "0",
                                  style:TextStyle(
                                    color : Colors.deepPurple,
                                    fontSize: fontSize
                                  )
                                  ),
                                )
                              )
                            ),
                          ),
                        ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(padding),
                          child: ClipRRect(
                              borderRadius : BorderRadius.circular(borderRadius),
                              child : Container(
                                  color : Colors.deepPurple[50],
                                  child : Center(
                                    child : Text(
                                        "0",
                                        style:TextStyle(
                                            color : Colors.deepPurple,
                                            fontSize: fontSize
                                        )
                                    ),
                                  )
                              )
                          ),
                        ),
                      )
                    ]
                  )
                  )
                ]
              )
            )
          ),
        ]
      )
    );
  }
}
