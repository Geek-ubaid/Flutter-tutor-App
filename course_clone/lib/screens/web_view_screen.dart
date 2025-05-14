import 'package:course_clone/states/make_favorite_controller.dart';
import 'package:course_clone/states/profile_controller.dart';
import 'package:course_clone/states/progress_tracker_controller.dart';
import 'package:course_clone/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    super.key,
    required this.url,
    required this.title,
    required this.id,
  });
  final String url;
  final String title;
  final String id;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final _key = GlobalKey<ExpandableFabState>();

  final WebViewController controller =
      WebViewController()
        ..setJavaScriptMode(JavaScriptMode.disabled)
        ..setBackgroundColor(AppColor.appBgColor);

  bool isLoading = true;

  @override
  void initState() {
    controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColor.appBgColor,
        centerTitle: true,
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        childrenAnimation: ExpandableFabAnimation.rotate,
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.black.withValues(alpha: 0.5),
          blur: 5,
        ),
        distance: 70,
        children: [
          FloatingActionButton.small(
            // shape: const CircleBorder(),
            heroTag: null,
            child: const Icon(Icons.check_box_outlined),
            onPressed: () {
              final ctrl = Get.find<ProgressTrackerContoller>();
              if (ctrl.completedCourses.contains(widget.id)) {
                Get.find<ProgressTrackerContoller>().removeFromCompleted(
                  widget.id,
                );
              } else {
                Get.find<ProgressTrackerContoller>().addToComplted(widget.id);
              }
              Get.snackbar('Success', 'Course marked as completed');
              _key.currentState?.toggle();
            },
          ),
          // FloatingActionButton.small(
          //   // shape: const CircleBorder(),
          //   heroTag: null,
          //   child: const Icon(Icons.bookmark),
          //   onPressed: () {
          //     final ctrl = Get.find<ProfileController>();
          //             ctrl.toggleBookmark();
          //     _key.currentState?.toggle();
          //   },
          // ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.share),
            onPressed: () async {
              await Share.share(widget.url);
              _key.currentState?.toggle();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
