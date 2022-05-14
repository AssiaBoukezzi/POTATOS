import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'api.dart';

class ResultPage extends StatefulWidget{
  final File image;
  ResultPage({Key? key, required this.image}):super( key : key );

  @override
  State<StatefulWidget> createState() => ResultPageState(image);
}

class ResultPageState extends State<ResultPage>{
  String captions="Refresh once !";
  var data;
  File image;
  FlutterTts ftts=FlutterTts();

  ResultPageState(this.image);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,),


        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[


                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:Color(0xFF7BB996) ,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),

                  ),
                 // height: 400,
                  padding: EdgeInsets.only(top:20,bottom:20,left:20,right: 20),
                child:Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Colors.white,width:12),

                  ),
                  child:displayImage(image),
                ),),
                SizedBox(height: 20,),
                Text("Description :",
                  style: TextStyle(
                    color: Color(0xff073f58),
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),),
                Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(

                       left: 20,
                     ),
                   child:ElevatedButton(
                     style: ButtonStyle(
                       padding: MaterialStateProperty.all(EdgeInsets.zero),
                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20)
                       )),
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                     ),
                     child: Container(
                       height: 20,
                       child: Image.asset('images/5.png'),
                     ),

                     onPressed: (){speakCaption();

                     },
                   ),
                   ),

                   SizedBox(width: 25,),
                   Text('People working on their Computers')
                 ],
                ),

                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                  ),
                  height: 140,
                  child: Image.asset('images/theo1.png'),
                ),
              ],

            ),
          ),
          /*
        floatingActionButton: FloatingActionButton.extended(
                  onPressed: () => Navigator.pushNamed(context, "/"),
                  icon: Icon(
                  Icons.arrow_back,color: Colors.black,size: 30,
                  ),
                  label: Text("Back",style: TextStyle(color: Colors.black),),
                  ),
        */
        ),

      ),
    );
  }

  Future getCaption() async{
    data=await getData(uploadUrl);

    setState(() {
      captions=data['captions'];
    });
  }

  speakCaption() async{
    await ftts.setLanguage("en-US");
    await ftts.setPitch(1);
    await ftts.speak("People Working on their computers");
  }

  Widget displayImage(File file) {
    return
       file == null ? Container() :Image.file(file,fit: BoxFit.cover,);
  }
}