part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 4),
          width: 50,
          height: 50,
          child: Center(
            child: SizedBox(
                height: 68,
                child: Image(image: AssetImage(getImageFromGenre(genre)))),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          genre,
          style: blackTextFont.copyWith(fontSize: 13),
        )
      ],
    );
  }

  String getImageFromGenre(String genre) {
    switch (genre) {
      case "Horror":
        return "assets/icon_horor.png";
        break;
      case "Music":
        return "assets/icon_music.png";
        break;
      case "Action":
        return "assets/icon_action.png";
        break;
      case "Drama":
        return "assets/icon_war.png";
        break;
      case "War":
        return "assets/icon_war.png";
        break;
      case "Crime":
        return "assets/icon_war.png";
        break;
      default:
        return "";
    }
  }
}
