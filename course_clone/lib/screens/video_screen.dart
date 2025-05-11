import 'dart:developer';

import 'package:course_clone/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key, required this.videoLink});

  final String videoLink;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  late YoutubeMetaData _videoMetaData;
  bool isPaused = false;
  late String currentPlayingVideoLink;
  String videoTitle = '';
  @override
  void initState() {
    super.initState();
    _videoMetaData = const YoutubeMetaData();
    currentPlayingVideoLink = widget.videoLink;
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener((isFullScreen) {
      log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
    });
    final id = YoutubePlayerController.convertUrlToId(widget.videoLink);
    assert(id != null, 'Invalid YouTube link');
    _controller.loadVideoById(videoId: id!);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      backgroundColor: AppColor.appBgColor,
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  player,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.orange,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: YoutubeValueBuilder(
                  controller: _controller,
                  builder: (context, value) {
                    final String title = value.metaData.title;
                    final String author = value.metaData.author;
                    final Duration duration = value.metaData.duration;

                    return Column(
                      children: [
                        videoInfo(context, title, 'Title'),
                        SizedBox(height: 8),
                        videoInfo(context, author, 'Author'),
                        SizedBox(height: 8),

                        videoInfo(
                          context,
                          '${duration.inMinutes.toString()} Minutes',
                          'Duration',
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.black45,
                margin: EdgeInsets.symmetric(horizontal: 0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(Icons.book, color: AppColor.orange),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "🔖 Before you continue, please read the GetX State Management section in your tutor guide.",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Open"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget videoInfo(BuildContext context, String value, String label) {
    // pick an icon based on the field
    IconData icon;
    switch (label) {
      case 'Title':
        icon = Icons.title;
        break;
      case 'Author':
        icon = Icons.person;
        break;
      case 'Duration':
        icon = Icons.schedule;
        break;
      default:
        icon = Icons.info;
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [AppColor.primary, Color.fromARGB(255, 179, 111, 108)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              '$label:',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                value.isEmpty ? 'Loading…' : value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
