import 'package:flutter/material.dart';
import 'choix.dart';

class thats_all extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                    color: Color(0xff7bb996),
                  ),
                ],
              )
          ),
          Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              child: Text(
                "That's all",
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
              "Now you are ready to start your journey !",
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
            child: Image.asset('images/theo5.png'),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 110,
              bottom: 20,
            ),
            width: double.infinity,
            height: 50,
            child : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff7bb996),

                //shape: StadiumBorder(),

              ),
              child: Text('Start',
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
                      builder: (context) => choix()
                  ),
                );
              },
            ),

          ),
        ],
      ),
    );
  }
}
