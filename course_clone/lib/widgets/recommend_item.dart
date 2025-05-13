import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(data.thumbnailUrl, height: 60, width: 60),
            const SizedBox(width: 10),
            Expanded(child: _buildInfo(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "May 7", // Consider using formatted date later
          style: TextStyle(fontSize: 12, color: AppColor.labelColor),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.favorite, color: Colors.redAccent, size: 14),
            const SizedBox(width: 4),
            Text("3", style: TextStyle(fontSize: 12, color: AppColor.labelColor)),
            const SizedBox(width: 16),
            Icon(Icons.label, color: AppColor.labelColor, size: 14),
            const SizedBox(width: 4),
            Text(data.topic, style: TextStyle(fontSize: 12, color: AppColor.labelColor)),
            const Spacer(),
            Icon(Icons.access_time, color: AppColor.labelColor, size: 14),
            const SizedBox(width: 4),
            Text(data.readingTime, style: TextStyle(fontSize: 12, color: AppColor.labelColor)),
          ],
        )
      ],
    );
  }

}
