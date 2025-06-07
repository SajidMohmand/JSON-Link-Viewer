import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_viewer/view_json_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ViewJson App",
          style: GoogleFonts.eduNswActFoundation(
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Paste Link here",
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),

          SizedBox(height: 20,),
          GestureDetector(

            onTap: (){

              if(textEditingController.text.isNotEmpty && textEditingController.text.toLowerCase().startsWith("https://")){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewJsonScreen(url: textEditingController.text.toString(),)));
              }else{

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Link Required Please Provide",style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  )
                );
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 13,right: 13),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
              ),

              child: Center(child: Text("View Your Json",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),),
            ),
          )
        ],
      ),
    );
  }
}
