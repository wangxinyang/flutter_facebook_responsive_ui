import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class CreateStories extends StatelessWidget {
  final List<Story> stories;
  final User currentUser;
  const CreateStories({
    Key key,
    @required this.stories,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: StoryCard(
                isAdd: true,
                currentUser: currentUser,
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: StoryCard(
              isAdd: false,
              currentUser: currentUser,
              story: stories[index - 1],
            ),
          );
        },
      ),
    );
  }
}
