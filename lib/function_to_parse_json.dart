import 'model_class.dart';

List<AndroidVersion> parseJson(dynamic input) {
  List<AndroidVersion> androidVersions = [];

  if (input is List) {
    for (var item in input) {
      if (item is Map) {
        item.forEach((key, value) {
          if (value is Map) {
            androidVersions.add(AndroidVersion(
              id: value['id'],
              title: value['title'],
            ));
          }
        });
      } else if (item is List) {
        for (var subItem in item) {
          androidVersions.add(AndroidVersion(
            id: subItem['id'],
            title: subItem['title'],
          ));
        }
      }
    }
  }

  return androidVersions;
}
