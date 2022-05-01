import 'package:flutter/material.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';
import 'Api.dart';

class Player_Youtube extends StatefulWidget {

  String? videoId = "";

  Player_Youtube({Key? key, this.videoId}) : super(key: key);

  @override
  _Player_YoutubeState createState() => _Player_YoutubeState();
}

class _Player_YoutubeState extends State<Player_Youtube> {


  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: widget.videoId!,

        params: YoutubePlayerParams(
          playsInline: true ,
          playlist: [widget.videoId!], // Defining custom playlist
          //startAt: Duration(seconds: 10),
          showVideoAnnotations: true,
          autoPlay: true,
          showControls: true,
          showFullscreenButton: true,
          mute: false,


        )
    );

    return YoutubePlayerControllerProvider(
      key: Key(CHAVE_YOUTUBE_API),// Provides controller to all the widget below it.
      controller: _controller,
      child: YoutubePlayerIFrame(
        aspectRatio: 16 / 9,
      ),
    );
  }

}
