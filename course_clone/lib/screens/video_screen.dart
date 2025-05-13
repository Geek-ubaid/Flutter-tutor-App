import 'package:course_clone/theme/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key, required this.videoLink});

  final String videoLink;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // 1️⃣ Create controller with params
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    // 2️⃣ Extract video ID and load it
    final id = YoutubePlayerController.convertUrlToId(widget.videoLink);
    assert(id != null, 'Invalid YouTube link: ${widget.videoLink}');
    _controller.loadVideoById(videoId: id!);

    // 3️⃣ Optional: listen for fullscreen changes
    _controller.setFullScreenListener((isFullScreen) {
      debugPrint(isFullScreen ? 'Entered Fullscreen.' : 'Exited Fullscreen.');
    });
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
      builder:
          (context, player) => Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ▶️ Video player with back button overlay
                Stack(
                  children: [
                    player,
                    Positioned(
                      top: 40,
                      left: 10,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColor.orange,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // ℹ️ Metadata pills
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: YoutubeValueBuilder(
                    controller: _controller,
                    builder: (context, value) {
                      final title = value.metaData.title;
                      final author = value.metaData.author;
                      final duration = value.metaData.duration;

                      Widget pill(IconData icon, String label, String text) {
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey.shade900,
                                Colors.grey.shade800,
                                Colors.grey.shade700,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  icon,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  '$label: ${text.isEmpty ? 'Loading…' : text}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return Column(
                        children: [
                          pill(Icons.title, 'Title', title),
                          const SizedBox(height: 8),
                          pill(Icons.person, 'Author', author),
                          const SizedBox(height: 8),
                          pill(
                            Icons.schedule,
                            'Duration',
                            '${duration.inMinutes} Minutes',
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // 📚 Tutor hint card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.book, color: Colors.white70),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "🔖 Before you continue, read the GetX State Management section in your guide.",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => Get.back(),
                        child: const Text('Open'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
    );
  }
}
