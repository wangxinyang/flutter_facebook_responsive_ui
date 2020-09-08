import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/conifg/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // Brightness.light白底黑字 Brightness.dark黑底白字
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                iconData: Icons.search,
                iconSize: 30,
                press: () {},
              ),
              CircleButton(
                iconData: MdiIcons.facebookMessenger,
                iconSize: 30,
                press: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          SliverToBoxAdapter(
            child: CreateRoomButton(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          SliverToBoxAdapter(
            child: CreateStories(
              stories: stories,
              currentUser: currentUser,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CreatePost(post: posts[index]);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
