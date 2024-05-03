import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
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
              child: Column(
                children: [
                  //user list
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    height: 108,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        )
                      )
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //user
                          User(userName: '내스토리',profilePicture: 'assets/Profile_picture_01.png',),
                          User(userName: 'flutter_framework',profilePicture: 'assets/Profile_picture_02.png',),
                          User(userName: 'soongsil_university',profilePicture: 'assets/Profile_picture_03.png',),
                          User(userName: 'mobile_programming',profilePicture: 'assets/Profile_picture_04.png',),
                          User(userName: 'global_media',profilePicture: 'assets/Profile_picture_05.png',),
                          User(userName: 'awesome_application',profilePicture: 'assets/Profile_picture_06.png',),
                        ],
                      ),
                    ),
                  ),
                  //feeds
                  Column(
                    children: [
                      //userinfo
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 52,
                        child: Row(
                          children: [
                            Image.asset('assets/Profile_picture_02.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'flutter_framework',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.more_horiz,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Feed_picture_01.png',
                            width: MediaQuery.of(context).size.width,
                          ),
                          Image.asset(
                            'assets/Feed_picture_02.png',
                            width: MediaQuery.of(context).size.width,
                          ),
                          Image.asset(
                            'assets/Feed_picture_03.png',
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    )
                    ],
                    //Feed pictures
                    
                  )
                ],
              )
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

class User extends StatelessWidget {
  final String userName;
  final String profilePicture;

  const User({
    super.key,
    required this.userName,
    required this.profilePicture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
                          horizontal: 6
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 71,
                                height: 71,
                                padding: const EdgeInsets.all(2.5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin:Alignment.bottomLeft,
                                    end:Alignment.topRight,
                                    stops:[0.2, 0.4, 0.6, 0.8, 1],
                                    colors:[
                                      Color(0xFFFFD600),
                                      Color(0xFFFF7A00),
                                      Color(0xFFFF0069),
                                      Color(0xFFD300C5),
                                      Color(0xFF7638FA),
                                    ],
                                  )
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(2.5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          profilePicture
                                        )
                                      )
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 71,
                                child: Text(
                                  //my story
                                  userName,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
  }
}