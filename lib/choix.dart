import 'package:flutter/material.dart';
import 'learn.dart';

class choix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 0,
            ),
            height: 230,
            child: Image.asset('images/fil.png'),
          ),
          SizedBox(
            width: 302.47,
            child: Text(
              "What method are you willing to use today ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff666363),
                fontSize: 20,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              top: 40,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ))
              ),
              child: Container(
                height: 120,
                child: Image.asset('images/learn.png'),
              ),

              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(title:"title")
                  ),
                );

              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 40,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ))
              ),
              child: Container(
                height: 120,
                child: Image.asset('images/test.png'),
              ),

              onPressed: (){

              },
            ),
          )

        ],
      ),
    );
  }
}
