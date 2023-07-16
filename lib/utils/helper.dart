// ignore: import_of_legacy_library_into_null_safe
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Helper {
  final storage = const FlutterSecureStorage();

  Future<String?> getIdToken() async {
    String? token = await storage.read(key: 'access-token');
    return token;
  }

  Future<String?> getRefreshToken() async {
    String? token = await storage.read(key: 'refresh-token');
    return token;
  }

  Future<String?> getCurrentUserId() async {
    String? userId = await storage.read(key: 'userId');
    return userId;
  }

  Future<String?> getCurrentUserEmail() async {
    String? email = await storage.read(key: 'email');
    return email;
  }

  Future<String?> getCurrentUserType() async {
    String? type = await storage.read(key: 'user-type');
    return type;
  }

  Future getImageFileFromAsset(List<Asset> images) async {
    final files = <dynamic>[];

    for (int i = 0; i < images.length; i++) {
      // var path = await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
      ByteData byteData = await images[i].getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      files.add(imageData);
    }

    return files;
  }

  // Future cacheImage(BuildContext context, String urlImage) => precacheImage(
  //       AdvancedNetworkImage(
  //         urlImage,
  //         useDiskCache: true,
  //         cacheRule: CacheRule(maxAge: const Duration(days: 7)),
  //       ),
  //       context,
  //     );

  String getDuration(String date) {
    DateTime dob = DateTime.parse(date);
    Duration dur = DateTime.now().difference(dob);
    double difference = double.parse((dur.inDays / 365).toString());
    //   String differenceInMonths = (dur.inDays / 30).floor().toString();
    if (difference >= 1) {
      return ("${difference.floor()} year ago");
    } else {
      double differenceInMonths = double.parse((dur.inDays / 30).toString());
      if (differenceInMonths >= 1) {
        return ("${differenceInMonths.floor()} months ago");
      } else {
        double differenceInWeeks = double.parse((dur.inDays / 7).toString());
        if (differenceInWeeks >= 1) {
          return ("${differenceInWeeks.floor()} week ago");
        } else {
          double differenceInDays = double.parse((dur.inDays).toString());
          if (differenceInDays >= 1) {
            return ("${differenceInDays.floor()} days ago");
          } else {
            double differenceInHours = double.parse((dur.inHours).toString());
            if (differenceInHours >= 1) {
              return ("${differenceInHours.floor()} hours ago");
            } else {
              double differenceInMinutes =
                  double.parse((dur.inMinutes).toString());
              return ("${differenceInMinutes.floor()} minutes ago");
            }
          }
        }
      }
    }
  }
}
