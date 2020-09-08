import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;

  Story({
    @required this.user,
    @required this.imageUrl,
    this.isViewed,
  });
}
