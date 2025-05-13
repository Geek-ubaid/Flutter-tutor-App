import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/theme/color.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({super.key, required this.data, this.onTap});

  final Course data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            SvgPicture.asset(
              data.thumbnailUrl,
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),

            // Info section
            Expanded(
              child: _buildInfo(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          data.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),

        // Date
        Text(
          "May 7",
          style: TextStyle(fontSize: 12, color: AppColor.labelColor),
        ),
        const SizedBox(height: 6),

        // Meta row
        Row(
          children: [
            Icon(Icons.favorite, color: Colors.redAccent, size: 14),
            const SizedBox(width: 4),
            Text("3", style: TextStyle(fontSize: 12, color: AppColor.labelColor)),

            const SizedBox(width: 12),
            Icon(Icons.label, color: AppColor.labelColor, size: 14),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                data.topic,
                style: TextStyle(fontSize: 12, color: AppColor.labelColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const Spacer(),
            Icon(Icons.access_time, color: AppColor.labelColor, size: 14),
            const SizedBox(width: 4),
            Text(data.readingTime, style: TextStyle(fontSize: 12, color: AppColor.labelColor)),
          ],
        ),
      ],
    );
  }
}
