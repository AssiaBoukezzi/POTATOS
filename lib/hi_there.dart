import 'package:flutter/material.dart';
import 'first.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'main.dart';

class hi_there extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
        Container(
          child : Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 90,
                  bottom: 0,
                  left: 7,
                  right: 1,
                ),

                height: 3,
                width: 56,
                color: Color(0xff7bb996),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 90,
                  bottom: 0,
                  left: 1,
                  right: 1,
                ),

                height: 3,
                width: 56,
                color: Color(0xffc6c5c5),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 90,
                  bottom: 0,
                  left: 1,
                  right: 1,
                ),

                height: 3,
                width: 56,
                color: Color(0xffc6c5c5),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 90,
                  bottom: 0,
                  left: 1,
                  right: 1,
                ),

                height: 3,
                width: 56,
                color: Color(0xffc6c5c5),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 90,
                  bottom: 0,
                  left: 1,
                  right: 1,
                ),

                height: 3,
                width: 56,
                color: Color(0xffc6c5c5),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 90,
                  bottom: 0,
                  left: 1,
                  right: 1,
                ),

                height: 3,
                width: 56,
                color: Color(0xffc6c5c5),
              ),
            ],
          )
        ),
        Container(
          margin: EdgeInsets.only(
            top: 30,
            bottom: 20,
          ),
          child: Text(
            "Hi there !",
            style: TextStyle(
              color: Color(0xfff87360),
              fontSize: 40,
              fontFamily: "Gloria",
            ),
          )
        ),
          SizedBox(
            width: 302.47,
            child: Text(
              "Before we start, we need to ask you few questions to get to know you better.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff666363),
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 60,
            ),
            height: 230,
            child: Image.asset('images/theo1.png'),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 80,
              bottom: 20,
            ),
            width: double.infinity,
            height: 50,
            child : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff7bb996),

                //shape: StadiumBorder(),

              ),
              child: Text('Begin',
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,)
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => first()
                  ),
                );
              },
          ),

          ),
          ]
        )
    );
  }
}
