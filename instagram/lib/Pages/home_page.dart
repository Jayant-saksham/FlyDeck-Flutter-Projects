import 'package:flutter/material.dart';
import 'package:instagram/Theme/colors.dart';
import 'package:instagram/Widgets/post_item.dart';
import 'package:instagram/Widgets/story_item.dart';
import 'package:instagram/constant/post_json.dart';
import 'package:instagram/constant/story_json.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      bottomNavigationBar: getBottomNavBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 15,
                      bottom: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          child: Stack(
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(profile),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 19,
                                  height: 19,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.blue[800],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            "${name}",
                            style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(stories.length, (index) {
                      return Story(
                        img: stories[index]['img'],
                        name: stories[index]['name'],
                      );
                    }),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white.withOpacity(0.3)),
            Column(
              children: List.generate(posts.length, (index) {
                return Post(
                  caption: posts[index]['caption'],
                  postImg: posts[index]['postImg'],
                  profileImg: posts[index]['profileImg'],
                  name: posts[index]['name'],
                  isLoved: posts[index]['isLoved'],
                  viewCount: posts[index]['commentCount'],
                  likedBy: posts[index]['likedBy'],
                  dayAgo: posts[index]['timeAgo'],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar getAppBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: appBarColor,
    centerTitle: true,
    title: Text(
      "Instagram",
      style: TextStyle(
        fontSize: 35,
        fontFamily: 'Billabong',
      ),
    ),
    leading: Icon(
      Icons.camera_alt_outlined,
      color: Colors.white,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.send),
      ),
    ],
  );
}

Widget getBottomNavBar() {
  return Container(
    height: 60,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.explore_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_outline_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
