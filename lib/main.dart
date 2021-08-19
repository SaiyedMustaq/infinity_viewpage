import 'package:flutter/material.dart';
import 'Customicons.dart';
import 'data.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var currentAspectRatio=12.0/16.0;
var widgetAspectRation=currentAspectRatio*1.2;
var verticalInset=20.0;

class _MyHomePageState extends State<MyHomePage> {

  var currentPage=image.length-1.0;


  @override
  Widget build(BuildContext context) {

    PageController pageController=PageController(initialPage: image.length-1);
    pageController.addListener((){
        setState(() {
         currentPage=pageController.page; 
        });
    });


    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
         bool isRight=delta>0;
          var start=padding+max(primaryCardLeft-horizontalinst*delta*(isRight ? 15:1),
          0.0);
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0,right:12.0 ,top:30.0              bottom: 8.0),
             start: start,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: (){
                    },
                  ),
                    IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: (){
                    },
                  )
                ],
              ),
            ),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Trending",
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: "Celibre-Semibold",
                  letterSpacing: 1.0
                ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz,size: 25.0,color: Colors.white,),
                  onPressed: (){

                  },
                )
              ],  
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 6.0),
                      child: Text(
                        "Animated",
                        style: TextStyle(color: Colors.white),
                        )
                    ),
                  ),
                ),
                SizedBox(width: 15.0),
                Text("25+ Stories",style: TextStyle(color: Colors.blueAccent),) 
              ],
              ),
            ),
            Stack(
              children: <Widget>[
              CardScrollWidged(currentPage),
              Positioned.fill(
                child: PageView.builder(
                  itemCount: image.length,
                  controller:pageController ,
                  reverse: true,
                  itemBuilder:(context,index){
                    return Container();
                  } ,
                ),
              )
            ],)
          ],
        ),
      )
    );
  }
}



class CardScrollWidged extends StatelessWidget{
  
  var currentPage;
  var padding=20.0;
  CardScrollWidged(this.currentPage);
  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRation,
      child: LayoutBuilder(
        builder: (context,contaraints){
          var height=contaraints.maxHeight;
          var width=contaraints.maxWidth;
          var safeWidth=width-2*padding;
          var safeHeight=height-2*padding;
          var heightofPrimaryCard=safeHeight;
          var widthtofPrimaryCard=safeWidth*currentAspectRatio;
          var primaryCardLeft=safeWidth-widgetAspectRation;
          var horizontalinst=primaryCardLeft/2;


          for(var i=0; i<image.length; i++){
            var delta=i-currentPage;
           bool isRight=delta>0;
            var start=padding+max(primaryCardLeft-horizontalinst*delta*(isRight ? 15:1),
            0.0);
            var cardItem=Positioned.directional(
              top: padding+verticalInset*max(-delta,0.0),
              bottom: padding+verticalInset*max(-delta,0.0),
             start: start,
             textDirection: TextDirection.ltr,
             child: AspectRatio(
               aspectRatio: widthtofPrimaryCard,
             ),
            );
          }
        }
      ),
    );
  }

}