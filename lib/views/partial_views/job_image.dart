import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class JobImage extends StatelessWidget {
  final Asset? asset;
  const JobImage({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.175,
      height: 75,
      child: AssetThumb(
        asset: asset!,
        width: 300,
        height: 300,
      ),
    );
  }
}
