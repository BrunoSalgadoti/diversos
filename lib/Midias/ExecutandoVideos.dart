import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExecutandoVideos extends StatefulWidget {
  const ExecutandoVideos({Key? key}) : super(key: key);

  @override
  _ExecutandoVideosState createState() => _ExecutandoVideosState();
}

class _ExecutandoVideosState extends State<ExecutandoVideos> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

// EXECUTANDO VIDEO APARTIR DA WEB---------------------------------------------
    /*
    _controller = VideoPlayerController.network(
      "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"
    )..initialize().then( (_){
      setState(() {
        _controller.play();
      });
    });
     */
//------------------------------------------------------------------------------
    _controller = VideoPlayerController.asset("videos/exemplo.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          // _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Text("Pressione Play"),

// EXECUTANDO VIDEO APARTIR DEA WEB---------------------------------------------
        /*
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
         */
//------------------------------------------------------------------------------
      ),

      floatingActionButton: FloatingActionButton(
        child:  Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
        ),
        onPressed: (){
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },

      ),
    );
  }
}
