import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      height: 42,
                      child: Row(
                        children: [
                          Image.asset('assets/Heart.png'),
                          const SizedBox(
                            width: 12,
                          ),
                          Image.asset('assets/Comment.png'),
                          const SizedBox(
                            width: 12,
                          ),
                          Image.asset('assets/Share.png'),
                          const Spacer(),
                          Image.asset('assets/Bookmark.png'),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: 'awsome_application',
                                  style : TextStyle(
                                    fontWeight: FontWeight.w600,
                                  )
                                ),
                                TextSpan(
                                  text: '님 외 ',
                                ),
                                TextSpan(
                                  text: '10명',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  )
                                ),
                                TextSpan(
                                  text: '이 좋아합니다.'
                                )
                              ]
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: 'flutter_framework',
                                  style : TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                ),
                                TextSpan(
                                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
                                )
                              ]
                            )
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '댓글 102개 모두 보기',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '1일 전',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 16,
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