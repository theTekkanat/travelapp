import 'package:flutter/material.dart';
import 'package:travelapp/FadeAnimation.dart';

 void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomePage(),
        )
);

 class HomePage extends StatefulWidget {
   @override
   _HomePageState createState() => _HomePageState();
}

 class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
   late PageController _pageController;
   int totalPage = 4;

   void _onScroll(){
   }

   @override
   void initState(){
     _pageController = PageController(
       initialPage: 0,
     )..addListener(_onScroll);

     super.initState();
   }

   @override
   void dispose() {
     _pageController.dispose();
     super.dispose();
   }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: PageView(
         controller: _pageController,
         children: <Widget> [
           makePage(
               image: 'assets/images/one.jpg',
               title: 'Istanbul',
               description: 'Istanbul (Turkish: İstanbul) is a mega city that sits in both Europe and Asia, divided by the Bosporus. Although it is the largest city of Turkey, it is not the capital. It is the largest city in Europe by population. It is also the 3rd largest European city in size.',
               page: '1',
           ),
           makePage(
               image: 'assets/images/two.jpg',
               title: 'Ankara',
               description: 'historically known as Ancyra and Angora, is the capital of Turkey. Located in the central part of Anatolia, the city has a population of 5.1 million in its urban center and 5.7 million in Ankara Province, making it Turkeys second-largest city after Istanbul, but first by the urban area (2,767 km2).',
               page: '2',
           ),
           makePage(
               image: 'assets/images/three.jpg',
               title: 'Antalya',
               description: 'Antalya (Turkish pronunciation: [anˈtalja]) is the fifth-most populous city in Turkey as well as the capital of Antalya Province. It is seen as the "capital of tourism" in Turkey. Located on Anatolias southwest coast bordered by the Taurus Mountains, Antalya is the largest Turkish city on the Mediterranean coast outside the Aegean region with over 2.6 million people in its metropolitan area.',
               page: '3',
           ),
           makePage(
               image: 'assets/images/four.jpg',
               title: 'Izmir',
               description: 'İzmir (UK: /ˈɪzmɪər/ IZ-meer, US: /ɪzˈmɪər/ iz-MEER; Turkish pronunciation: [ˈizmiɾ]), is a metropolitan city on the west coast of Anatolia, and capital of İzmir Province. It is the third most populous city in Turkey, after Istanbul and Ankara, and the largest urban agglomeration on the Aegean Sea.',
               page: '4',

           ),
         ],
       ),
     );
   }

   Widget makePage({image, title, description, page}) {
     return Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage(image),
           fit: BoxFit.cover
         )
       ),
       child: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.bottomRight,
             stops: [0.1, 0.9],
             colors: [
               Colors.black.withOpacity(.9),
               Colors.black.withOpacity(.2),
             ]
           )
         ),
         child: Padding(
           padding: EdgeInsets.all(20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               SizedBox(
                 height: 40,
               ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.baseline,
               textBaseline: TextBaseline.alphabetic,
               children: <Widget>[
                 Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                 Text('/' + totalPage.toString(), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)
               ],
             ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(2,
                    Text(title, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color:Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color:Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color:Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color:Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color:Colors.grey, size: 15,),
                        ),
                        Text('4.0', style: TextStyle(color: Colors.white70),),
                        Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child:Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),) ,
                    ),
                    SizedBox(height: 20,),
                    Text('READ MORE', style: TextStyle(color: Colors.white),),
                    SizedBox(height: 30,),
                  ],
                ),
              )
             ]
           ),
         ),
       ),
     );
   }
 }



