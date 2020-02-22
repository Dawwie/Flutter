import 'package:flutter/material.dart';
import 'package:flutter_workshop_1/models.dart';

import 'games_view_model.dart';

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  Future<List<Game>> futureGames;
  GameViewModel gameViewModel;

  @override
  void initState() {
    super.initState();
    gameViewModel = GameViewModel();
    futureGames = gameViewModel.fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Game>>(
          future: futureGames,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GameItem(
                    title: snapshot.data[index].name,
                    subtitle: "subtitle",
                    imageUrl: snapshot.data[index].backgroundImage,
                    onPressed: () => {},
                  );
                },
                itemCount: snapshot.data.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class GameItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const GameItem(
      {Key key,
      this.imageUrl = "https://picsum.photos/60/60",
      @required this.title,
      @required this.subtitle,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 60.0,
                height: 60.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.title),
                      Text(subtitle,
                          style: Theme.of(context).textTheme.subtitle1),
                    ]),
              ),
            ),
            Icon(Icons.keyboard_arrow_right)
          ]),
        ),
      ),
    );
  }
}
