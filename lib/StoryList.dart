import 'package:flutter/material.dart';
import 'StoriesCard.dart';
import 'Stories.dart';

class StoryList extends StatelessWidget {
  // Builder methods rely on a set of data, such as a list.
  final List<Story> storiesList;
  StoryList(this.storiesList);

  // First, make your build method like normal.
  // Instead of returning Widgets, return a method that returns widgets.
  // Don't forget to pass in the context!
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

 

  ListView _buildList(context) {
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: storiesList.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        return StoriesCard(storiesList[int]);
      },
    );
  }
}