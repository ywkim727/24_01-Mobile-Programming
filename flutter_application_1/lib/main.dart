import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
             //status bar
            const SizedBox(
              height: 44,
            ),
            //top
            Container(
              padding: EdgeInsets.fromLTRB(10, 6, 15, 0),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Image.asset("assets/Instagram_logo.png"),
                Row(
                  children: [
                    Image.asset(
                      "assets/Add.png",
                      width: 26,
                      height: 26,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Image.asset(
                      "assets/Heart.png",
                      width: 26,
                      height: 26,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Image.asset(
                      "assets/Share.png",
                      width: 26,
                      height: 26,
                    ),
                  ],
                ),
              ],
                
              ),
            ),
            Expanded( //body
              child: Row()
            ),
            Container(  //bottom
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Home.png'),
                  Image.asset('assets/Search.png'),
                  Image.asset('assets/Reels.png'),
                  Image.asset('assets/Shop.png'),
                  Image.asset('assets/Profile_picture_01.png'),
                ],
              ),
            )

          ]
         
        )
           
          
        ),
      );
  }
}
