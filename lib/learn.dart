import 'dart:io';   // for File
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackitt/result.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? image;
  String resultText = "Hello...";
  Future<Map<String,dynamic>?> getResponse(File imageFile) async{
    //save data types into typeData
    final typeData = lookupMimeType(imageFile.path, headerBytes: [0xFF,0xD8])!.split("/");
    //POSTING OUR IMAGE TO API URL
    final imgUploadRequest = http.MultipartRequest("POST", Uri.parse("http://image-prediction-model-d3manch1-dev.apps.sandbox.x8i5.p1.openshiftapps.com/model/predict"));
    //CHECK THE TYPE
    final file = await http.MultipartFile.fromPath("image", imageFile.path, contentType: MediaType(typeData[0],typeData[1]));
    imgUploadRequest.fields["ext"]=typeData[1];
    imgUploadRequest.files.add(file);

    //SEND THE REQUEST GET RESPONSE AND RETURN
    try{
      final responseUpload = await imgUploadRequest.send();
      //GET RESPONSE JSON
      final response = await http.Response.fromStream(responseUpload);
      //DECODE THE JSON
      final Map<String, dynamic> responseData = json.decode(response.body);
      parseResponse(responseData);
      return responseData;
    }
    catch(e){
      //print the error
      print(e);
      return null;
    }

  }

  parseResponse(var response){
    //create an empty result at start
    String result = "";
    //get predictions from uploaded img file
    var predictions = response["predictions"];
    //to get the index of this iteration, it will start from '0'
    int order=0;
    //loop predictions with for each
    for(var pred in predictions){
      //increase the index for each element, so we can get their orders 1-2-3-4
      order++;
      //get each prediction to our caption variable with their order number
      var caption = order.toString()+" - " +pred["caption"];
      //todo:process probability value later
      var probability = pred["probability"];
      result =  result + caption + "\n";
    }

    //this is going to change our textfields with our parsed result string
    setState(() {
      resultText = result;
    });
  }
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image=imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }

  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 40,
            ),
            height: 340,
            width: double.infinity,
            child: Image.asset('images/1.png'),
          ),
          SizedBox(
            width: 302.47,
            child: Text(
              "Learn from my Environment",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff073f58),
                fontSize: 24,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
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
                )),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

              ),
              child: Container(
                height: 72,
                child: Image.asset('images/2.png'),
              ),

              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "yy")
                    )
                );
                pickImage();

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
                )),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

              ),
              child: Container(
                height: 72,
                child: Image.asset('images/3.png'),
              ),

              onPressed: (){pickImageC();

              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            child: ElevatedButton(

              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                  )
                  ),

              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF7BB996)),
              ),
              child: Text("Next"),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(image: image!)
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
